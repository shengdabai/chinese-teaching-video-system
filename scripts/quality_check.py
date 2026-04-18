#!/usr/bin/env python3
"""
质量检查脚本
用法: python scripts/quality_check.py <project_id>
"""

import os
import subprocess
import sys


def main():
    if len(sys.argv) < 2:
        print("❌ 用法: python scripts/quality_check.py <project_id>")
        sys.exit(1)

    project_id = sys.argv[1]
    project_dir = os.path.join("projects", project_id)

    if not os.path.isdir(project_dir):
        print(f"❌ 项目目录不存在: {project_dir}")
        sys.exit(1)

    print("🔍 质量检查开始...")
    print("=" * 60)

    checks = []
    required_files = [
        "01_brief.md",
        "02_script.json",
        "03_shotlist.csv",
        "04_character_sheet.md",
        "05_image_prompts.md",
        "06_video_prompts.md",
        "07_subtitles.srt",
        "08_voiceover.txt",
        "09_seo_package.md",
        "10_edit_manifest.json"
    ]

    for filename in required_files:
        filepath = os.path.join(project_dir, filename)
        exists = os.path.exists(filepath)
        checks.append(("文件完整性", filename, "PASS" if exists else "FAIL", "" if exists else "🔴"))

    todo_count = 0
    for filename in required_files:
        filepath = os.path.join(project_dir, filename)
        if os.path.exists(filepath):
            with open(filepath, "r", encoding="utf-8") as handle:
                content = handle.read()
            count = content.count("[TODO")
            if count > 0:
                todo_count += count
                checks.append(("内容完整性", f"{filename} 有 {count} 个 [TODO] 未填写", "WARN", "🟡"))
    if todo_count == 0:
        checks.append(("内容完整性", "所有[TODO]已填写", "PASS", ""))

    final_video = os.path.join(project_dir, "output", f"final_{project_id}.mp4")
    if os.path.exists(final_video):
        try:
            result = subprocess.run(
                ["ffprobe", "-v", "error", "-show_entries", "format=duration", "-of", "csv=p=0", final_video],
                capture_output=True,
                text=True,
                check=False
            )
            duration = float(result.stdout.strip())
            if duration > 60:
                checks.append(("视频时长", f"{duration:.1f}秒 (超过60秒!)", "FAIL", "🔴"))
            elif duration > 58:
                checks.append(("视频时长", f"{duration:.1f}秒 (接近上限)", "WARN", "🟡"))
            else:
                checks.append(("视频时长", f"{duration:.1f}秒", "PASS", ""))
        except Exception:
            checks.append(("视频时长", "无法检测", "WARN", "🟡"))

        try:
            result = subprocess.run(
                ["ffprobe", "-v", "error", "-select_streams", "v:0", "-show_entries", "stream=width,height", "-of", "csv=p=0", final_video],
                capture_output=True,
                text=True,
                check=False
            )
            dims = result.stdout.strip()
            if "1080,1920" in dims or "1080x1920" in dims:
                checks.append(("分辨率", "1080x1920 ✓", "PASS", ""))
            else:
                checks.append(("分辨率", f"{dims} (应为1080x1920)", "FAIL", "🔴"))
        except Exception:
            checks.append(("分辨率", "无法检测", "WARN", "🟡"))
    else:
        checks.append(("最终视频", "文件不存在", "FAIL", "🔴"))

    seo_path = os.path.join(project_dir, "09_seo_package.md")
    if os.path.exists(seo_path):
        with open(seo_path, "r", encoding="utf-8") as handle:
            seo_content = handle.read()
        if "YouTube Title" in seo_content and "[TODO" not in seo_content:
            checks.append(("SEO就绪", "标题和描述已填写", "PASS", ""))
        else:
            checks.append(("SEO就绪", "SEO包未完成", "WARN", "🟡"))

    checks.append(("AI标注", "⚠️ 上传时必须勾选 'Altered or synthetic content'", "REMIND", "⚠️"))

    print(f"\n{'类别':<15} {'检查项':<45} {'结果':<8} {'标记'}")
    print("-" * 75)

    fail_count = 0
    warn_count = 0
    for category, item, result, flag in checks:
        print(f"{category:<15} {item:<45} {result:<8} {flag}")
        if result == "FAIL":
            fail_count += 1
        elif result == "WARN":
            warn_count += 1

    print("\n" + "=" * 60)
    if fail_count > 0:
        print(f"❌ 有 {fail_count} 个必须修复的问题")
    elif warn_count > 0:
        print(f"⚠️  有 {warn_count} 个警告，建议处理后再发布")
    else:
        print("✅ 所有检查通过！可以发布")


if __name__ == "__main__":
    main()
