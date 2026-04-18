# AI中文教学动画短视频标准化生产系统需求说明

## 项目目标
搭建一个完整的 AI 中文教学短视频生产系统，围绕固定熊猫 IP 形象，批量制作面向外国学习者的 YouTube Shorts 中文教学动画视频。

## 生产原则
1. 所有视频中的汉字、拼音、英文翻译统一后期叠加，绝不依赖 AI 视频平台直接生成文字。
2. 视频生成优先采用 Image-to-Video 流程，先产出关键帧，再生成动态镜头。
3. 角色描述必须使用固定的 Character Identity Block，逐字复制，不允许擅自改写。
4. 导出规格统一为 9:16 竖版、1080x1920、30fps、H.264 MP4，目标时长 45 到 55 秒。
5. 发布到 YouTube Shorts 时，必须在 YouTube Studio 勾选 AI 合成内容标注。

## 项目结构要求
系统由以下六个层面组成：
- 根目录说明文件：`CLAUDE.md`、`README.md`
- 配置层：角色、品牌、导出参数、平台提示词配置
- 模板层：脚本、brief、分镜、字幕、旁白、SEO、剪辑清单、分镜板模板
- 自动化层：项目生成、素材预处理、自动剪辑、字幕烧录、混音、片头片尾、批量生成、质量检查
- 控制台层：纯前端 HTML/CSS/JS 单页应用，提供 6 个生产模块
- 文档层：工作流指南、平台操作、FFmpeg 速查、排错、YouTube SEO

## 目录骨架
```text
chinese-teaching-video-system/
├── CLAUDE.md
├── README.md
├── PROJECT_SPEC.md
├── config/
├── templates/
├── scripts/
├── assets/
├── projects/
├── console/
└── docs/
```

## 配置文件要求
- `config/character_sheet.md`：固定角色身份锚定文件，必须包含中英文角色块与禁止变化规则
- `config/brand_config.json`：频道名称、品牌色、字幕样式、CTA、社媒链接
- `config/export_presets.json`：YouTube Shorts 与 TikTok 导出参数
- `config/platform_prompts_config.json`：PixVerse、即梦、Liblib 的提示词规则与默认参数

## 模板文件要求
- `templates/script_template.json`
- `templates/brief_template.md`
- `templates/shotlist_template.csv`
- `templates/image_prompt_template.md`
- `templates/video_prompt_template.md`
- `templates/subtitle_template.srt`
- `templates/voiceover_template.txt`
- `templates/seo_package_template.md`
- `templates/edit_manifest_template.json`
- `templates/storyboard_55s.md`
- `templates/storyboard_35s.md`

## 自动化脚本要求
- `scripts/generate_project.py`：交互式生成项目文件夹与 10 份项目文件
- `scripts/normalize_clips.sh`：统一分辨率、比例、帧率与编码格式
- `scripts/auto_edit.sh`：根据剪辑清单拼接时间线
- `scripts/burn_subtitles.sh`：字幕转换与烧录
- `scripts/mix_audio.sh`：旁白和 BGM ducking 混音
- `scripts/add_intro_outro.sh`：拼接品牌片头片尾
- `scripts/full_pipeline.sh`：一键跑通完整流水线
- `scripts/batch_generate.sh`：批量生成多个项目
- `scripts/quality_check.py`：检查文件、TODO、时长、分辨率、SEO 与合规提醒

## Web 控制台要求
单页应用共 6 个模块：
1. Topic Intake：主题输入与命令复制
2. Script Engine：脚本 JSON 可视化编辑
3. Prompt Pack Builder：图片与视频提示词自动组合
4. Clip Inbox & Asset Manager：素材状态看板与素材库浏览
5. Auto Editor：时间线展示、拖拽排序、FFmpeg 命令生成
6. Publish Dashboard：SEO 内容、发布清单、发布日历与 AI 标注提醒

## 文档要求
- `docs/workflow_guide.md`
- `docs/platform_guide.md`
- `docs/ffmpeg_cheatsheet.md`
- `docs/troubleshooting.md`
- `docs/youtube_seo_guide.md`

## 最终交付要求
1. 所有目录与文件创建完整。
2. Shell 脚本与 Python 脚本设置可执行权限。
3. 空目录补齐 `.gitkeep`。
4. 所有 JSON 文件可解析。
5. 运行一次 `python scripts/generate_project.py`，使用主题“谢谢 / Thank You”等预设输入，生成示例项目。
6. 输出最终目录树，确认结构无缺失。
