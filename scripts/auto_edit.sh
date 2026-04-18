#!/bin/bash
# 自动剪辑脚本：根据edit_manifest.json自动拼接时间线
# 用法: bash scripts/auto_edit.sh <project_id>

set -euo pipefail

PROJECT_ID="${1:-}"
if [ -z "$PROJECT_ID" ]; then
    echo "❌ 用法: bash scripts/auto_edit.sh <project_id>"
    exit 1
fi

PROJECT_DIR="projects/$PROJECT_ID"
MANIFEST="$PROJECT_DIR/10_edit_manifest.json"
OUTPUT_DIR="$PROJECT_DIR/output"
LOG_DIR="$PROJECT_DIR/logs"
CONCAT_LIST="$LOG_DIR/concat_list.txt"

mkdir -p "$OUTPUT_DIR" "$LOG_DIR"

if [ ! -f "$MANIFEST" ]; then
    echo "❌ 找不到 edit_manifest.json: $MANIFEST"
    exit 1
fi

echo "🎬 开始自动剪辑..."

python3 - <<PY
import json

manifest_path = "$MANIFEST"
concat_path = "$CONCAT_LIST"

with open(manifest_path, "r", encoding="utf-8") as handle:
    manifest = json.load(handle)

concat_lines = []
for item in manifest.get("timeline", []):
    source = item.get("source", "")
    if source:
        concat_lines.append(f"file '../../../{source}'")
        duration = item.get("end_trim", item.get("duration", 0))
        if duration:
            concat_lines.append(f"duration {duration}")

with open(concat_path, "w", encoding="utf-8") as handle:
    handle.write("\n".join(concat_lines))

print(f"Generated concat list with {len([line for line in concat_lines if line.startswith('file ')])} clips")
PY

echo "  📎 拼接视频..."
ffmpeg -y -f concat -safe 0 -i "$CONCAT_LIST" \
    -c:v libx264 -preset slow -crf 18 \
    -pix_fmt yuv420p \
    -r 30 \
    "$OUTPUT_DIR/rough_cut_no_audio.mp4" \
    2>"$LOG_DIR/concat.log"

echo "✅ Rough cut 生成完成: $OUTPUT_DIR/rough_cut_no_audio.mp4"
echo "⏭️  下一步: 运行 burn_subtitles.sh 和 mix_audio.sh"
