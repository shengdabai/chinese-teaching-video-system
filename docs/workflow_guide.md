# 🐼 AI中文教学视频 — 完整工作流指南

## 概述
本系统用于批量生产 AI 中文教学动画短视频，发布 YouTube Shorts。它把选题、脚本、提示词、素材生成、自动剪辑、SEO 与发布检查串成一条标准化流水线。

## 工作流总览
1. 输入主题
2. AI 生成文件包
3. Liblib 出图
4. PixVerse / 即梦出视频
5. FFmpeg 自动剪辑
6. 剪映美化
7. YouTube 发布

## 详细步骤

### Step 1: 创建新项目
```bash
cd chinese-teaching-video-system
python3 scripts/generate_project.py
```

按提示输入主题信息，系统自动创建项目文件夹和 10 份模板文件。

### Step 2: 完善脚本内容
打开 `projects/[项目ID]/` 目录，填写所有 `[TODO]` 标记的内容：
- `02_script.json`：每个镜头的旁白文本
- `03_shotlist.csv`：每个镜头的详细参数
- `05_image_prompts.md`：完善每条图片提示词
- `06_video_prompts.md`：完善每条视频提示词
- `07_subtitles.srt`：填写完整字幕

### Step 3: 在 LiblibAI 生成关键帧图
1. 打开 `05_image_prompts.md`
2. 复制每条 prompt 到 LiblibAI
3. 生成图片，检查角色一致性
4. 满意后保存到 `projects/[项目ID]/keyframes/`
5. 命名规范：`keyframe_shot01_v1.png`

### Step 4: 在 PixVerse V6 / 即梦 AI 生成视频
1. 打开 `06_video_prompts.md`
2. 在 PixVerse V6 中：
   - 选择 Image-to-Video 模式
   - 上传对应的 keyframe 图片
   - 粘贴 prompt
   - 设置：V6 Standard、1080p、9:16、15s、Motion Strength: medium-low
   - 生成视频
3. 在即梦 AI 中生成环境镜头，例如 Shot 5
4. 下载所有视频到 `projects/[项目ID]/raw_clips/`
5. 命名规范：`shot_01.mp4`、`shot_02.mp4`

### Step 5: 一键自动剪辑
```bash
bash scripts/full_pipeline.sh [项目ID]
```

系统自动完成：预处理 → 拼接 → 字幕烧录 → 混音 → 片头片尾。

### Step 6: 剪映美化（可选）
用剪映 / CapCut 打开 `output/final_[项目ID].mp4`，做最终微调：
- 关键词高亮动效
- 字幕样式美化
- BGM 节拍微调
- 封面制作

### Step 7: 质量检查
```bash
python3 scripts/quality_check.py [项目ID]
```

### Step 8: YouTube 发布
1. 上传视频到 YouTube Studio
2. 从 `09_seo_package.md` 复制标题、描述、标签
3. 勾选 `"Altered or synthetic content"`
4. 设置缩略图
5. 发布

## 关键规则
1. **文字零容忍**：视频画面中绝不包含 AI 生成的文字，所有文字后期叠加
2. **角色一致性**：每次使用 Image-to-Video 模式，每次复制完整 Character Identity Block
3. **时长控制**：YouTube Shorts ≤ 60 秒，目标 45 到 55 秒
4. **AI 标注**：每条视频必须标注 AI 合成内容
5. **额度节约**：先 Preview 后 Full，每镜头最多 2 版，尽量复用素材库

## 推荐节奏
- 每个主题先做 1 条 A_55s 正式版
- 同主题拆 1 条 B_35s 测试版
- 表现好的词汇再扩展成系列内容

## 文件协同建议
- `02_script.json` 负责语义与镜头信息
- `03_shotlist.csv` 负责镜头执行清单
- `05_image_prompts.md` 与 `06_video_prompts.md` 负责外部平台生产
- `10_edit_manifest.json` 负责 FFmpeg 时间线
- `09_seo_package.md` 负责发布包装
