# 🎬 Chinese Teaching Video System

**English | [中文](#中文)**

[![Last commit](https://img.shields.io/github/last-commit/shengdabai/chinese-teaching-video-system)](https://github.com/shengdabai/chinese-teaching-video-system/commits)
[![Stars](https://img.shields.io/github/stars/shengdabai/chinese-teaching-video-system?style=social)](https://github.com/shengdabai/chinese-teaching-video-system/stargazers)
[![Follow @shengdabai](https://img.shields.io/github/followers/shengdabai?style=social)](https://github.com/shengdabai)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)

> Turn one Chinese teaching topic into a finished, on-brand AI short — a browser console, reusable prompt templates, and FFmpeg automation in one repeatable pipeline.

Built in public by a working Chinese-language teacher (6000+ students). [中文文档在下方](#中文)

---

## Why this exists

Producing educational AI shorts consistently is hard because the workflow is fragmented — topic planning lives in notes, shot breakdowns live in spreadsheets, prompts get lost across tools, asset tracking is manual, and post-production is repetitive. **Chinese Teaching Video System** collapses all of that into one structured pipeline so a single creator can ship a polished short, repeatedly, without re-inventing the process each time.

## What it is

An open-source production system for AI-generated Chinese teaching animation shorts (YouTube Shorts / TikTok), built around a fixed panda-teacher IP. Three parts work together:

- **🖥️ Browser console** — a pure-frontend single-page app (HTML/CSS/JS, no build, no server) that plans topics, edits scripts, builds prompt packs, tracks shots on a kanban, and prepares publishing metadata. State lives in `localStorage`, so it runs fully offline.
- **🧩 Prompt templates** — standardized, ready-to-fill templates for scripts, briefs, shotlists, image/video prompts, subtitles, voiceover, SEO packages, and edit manifests, tuned for LiblibAI, PixVerse V6, and Jimeng AI.
- **🎞️ FFmpeg automation** — shell scripts that normalize clips, assemble the timeline, burn in subtitles, mix audio with BGM ducking, and stitch brand intro/outro — chainable into a one-command full pipeline.

## ✨ Features

- **Locked character identity** — a fixed panda-teacher IP via [`config/character_sheet.md`](./config/character_sheet.md), pasted verbatim into prompts for consistency across videos
- **Repeatable project scaffolding** — [`scripts/generate_project.py`](./scripts/generate_project.py) spins up a per-video folder with 10 ready-to-fill files from a single topic
- **Prompt pack generation** for LiblibAI (keyframes), PixVerse V6 + Jimeng AI (clips)
- **Full FFmpeg post-production** — normalization → timeline assembly → subtitle burn-in → audio mix → intro/outro in [`scripts/`](./scripts)
- **6-module web console** — Topic Intake · Script Engine · Prompt Pack Builder · Clip Inbox · Auto Editor · Publish Dashboard
- **Batch + quality checks** — `batch_generate.sh` for multiple projects, `quality_check.py` for files, TODOs, duration, resolution, SEO, and compliance
- **Worked example** in [`projects/_example_project`](./projects/_example_project) and full docs in [`docs/`](./docs)

## 🧱 Tech stack

| Layer | Tooling |
|-------|---------|
| Scripts / copy | Claude · ChatGPT |
| Keyframes | LiblibAI |
| Video generation | PixVerse V6 (primary) · Jimeng AI (secondary) |
| Auto editing | **FFmpeg** (core engine) |
| Final polish | CapCut / 剪映 |
| Orchestration | n8n (optional) |
| Console | Pure frontend HTML / CSS / JS |

## 🚀 Quick start

```bash
# 1. Clone
git clone https://github.com/shengdabai/chinese-teaching-video-system.git
cd chinese-teaching-video-system

# 2. Generate a new project (interactive: topic, audience, length, style, SEO)
python3 scripts/generate_project.py

# 3. Open the web console — just open the file in your browser
open console/index.html

# 4. After dropping in generated clips, run the full pipeline
bash scripts/full_pipeline.sh <project_id>

# 5. Quality check before publishing
python3 scripts/quality_check.py <project_id>
```

> Requirements: [FFmpeg](https://ffmpeg.org/) on your PATH and Python 3. The console needs nothing — open `console/index.html` directly.

## 📖 Usage / workflow

1. **Create** a project folder from a topic with `generate_project.py`
2. **Fill in** the generated brief, script, prompts, subtitles, voiceover, SEO package, and edit manifest (the console helps here)
3. **Generate keyframes** in LiblibAI
4. **Generate clips** in PixVerse V6 and Jimeng AI
5. **Drop** raw assets into the project directory
6. **Run** the FFmpeg pipeline (`full_pipeline.sh`)
7. **Review** the output, polish in CapCut if needed, and publish with AI-content disclosure enabled

**Production rules baked into the system:**
- Never let AI video platforms render Chinese text, pinyin, or subtitles in-scene — all text is overlaid in post
- Prefer Image-to-Video to stabilize character consistency
- Paste the character identity block verbatim into prompts
- Export vertical `1080x1920`, `30fps`, `H.264 MP4`, 45–55s
- Always disclose synthetic content in YouTube Studio

## 🗺️ Status

Actively built in public. Working today: project generation, the 6-module console (offline `localStorage`), prompt templates, and the full FFmpeg pipeline (validated with JS/Python/Shell syntax checks). On the roadmap:

- Browser ↔ on-disk project file sync
- Visual timeline editing with persistent manifest updates
- Richer reusable-asset previews
- Optional automation hooks (n8n / publishing integrations)

## 🤝 Connect / About

Built by **Tony (Sheng)** — a Chinese-language teacher with 6000+ students, building AI + Chinese-teaching tools in public.

If this is useful, **⭐ Star the repo and [follow @shengdabai](https://github.com/shengdabai)** to follow along. Issues and PRs welcome — templates, FFmpeg transitions, prompt-builder logic, and localization are all great places to start.

**Related projects worth a look:** `ai-video-workflow` · `content-creator-hub` · `ai-video-generator`

## License

[MIT](./LICENSE) © Tony (Sheng)

---

<a name="中文"></a>

# 🎬 中文教学短视频生产系统

**[English](#-chinese-teaching-video-system) | 中文**

[![Last commit](https://img.shields.io/github/last-commit/shengdabai/chinese-teaching-video-system)](https://github.com/shengdabai/chinese-teaching-video-system/commits)
[![Stars](https://img.shields.io/github/stars/shengdabai/chinese-teaching-video-system?style=social)](https://github.com/shengdabai/chinese-teaching-video-system/stargazers)
[![Follow @shengdabai](https://img.shields.io/github/followers/shengdabai?style=social)](https://github.com/shengdabai)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)

> 把一个中文教学主题，变成一条成品的、风格统一的 AI 短视频 —— 网页控制台、可复用提示词模板、FFmpeg 自动化，合成一条可复制的流水线。

由一名一线中文老师（6000+ 学员）公开（build in public）开发。

---

## 为什么做这个项目

AI 教学短视频的生产流程往往很碎片化：选题在文档里、分镜在表格里、提示词散落在不同平台、素材进度靠手工记、后期步骤重复而机械。**中文教学短视频生产系统**把这些环节收束成一套结构化流水线，让一个人也能稳定、可复制地把一条短视频做出来，不必每次重新发明流程。

## 它是什么

一个开源的 AI 中文教学动画短视频生产系统（面向 YouTube Shorts / TikTok），围绕固定的熊猫老师 IP。三个部分协同工作：

- **🖥️ 网页控制台** —— 纯前端单页应用（HTML/CSS/JS，无需构建、无需服务器），用于录入选题、编辑脚本、生成提示词包、看板跟踪镜头、准备发布资料。数据存在 `localStorage`，完全可脱机使用。
- **🧩 提示词模板** —— 标准化、可直接填写的模板，覆盖脚本、brief、分镜表、图片/视频提示词、字幕、旁白、SEO 包和剪辑清单，并针对 LiblibAI、PixVerse V6、即梦 AI 调优。
- **🎞️ FFmpeg 自动化** —— 一系列 shell 脚本：素材归一化、时间线拼接、字幕烧录、BGM ducking 混音、品牌片头片尾拼接，可串联成一键全流程。

## ✨ 核心能力

- **固定角色锚定** —— 通过 [`config/character_sheet.md`](./config/character_sheet.md) 固定熊猫老师 IP，提示词中逐字粘贴，保证跨视频一致
- **可复制项目脚手架** —— [`scripts/generate_project.py`](./scripts/generate_project.py) 按一个主题生成包含 10 份待填文件的项目文件夹
- **提示词包生成** —— 支持 LiblibAI（关键帧）、PixVerse V6 + 即梦 AI（镜头）
- **完整 FFmpeg 后期** —— 归一化 → 时间线拼接 → 字幕烧录 → 混音 → 片头片尾，全在 [`scripts/`](./scripts)
- **6 模块网页控制台** —— Topic Intake · Script Engine · Prompt Pack Builder · Clip Inbox · Auto Editor · Publish Dashboard
- **批量 + 质量检查** —— `batch_generate.sh` 批量生成，`quality_check.py` 检查文件、TODO、时长、分辨率、SEO 与合规
- **示例项目** 见 [`projects/_example_project`](./projects/_example_project)，完整文档见 [`docs/`](./docs)

## 🧱 技术栈

| 环节 | 工具 |
|------|------|
| 脚本 / 文案 | Claude · ChatGPT |
| 静态图 | LiblibAI |
| 视频生成 | PixVerse V6（主）· 即梦 AI（辅）|
| 自动剪辑 | **FFmpeg**（核心引擎）|
| 最终美化 | 剪映 / CapCut |
| 工作流编排 | n8n（可选）|
| 控制台 | 纯前端 HTML / CSS / JS |

## 🚀 快速开始

```bash
# 1. 克隆
git clone https://github.com/shengdabai/chinese-teaching-video-system.git
cd chinese-teaching-video-system

# 2. 生成新项目（交互式：主题、人群、时长、风格、SEO）
python3 scripts/generate_project.py

# 3. 打开网页控制台 —— 直接用浏览器打开文件即可
open console/index.html

# 4. 放入生成的素材后，运行完整流水线
bash scripts/full_pipeline.sh <项目ID>

# 5. 发布前做质量检查
python3 scripts/quality_check.py <项目ID>
```

> 依赖：PATH 中有 [FFmpeg](https://ffmpeg.org/) 和 Python 3。控制台无任何依赖，直接打开 `console/index.html` 即可。

## 📖 使用 / 工作流

1. 用 `generate_project.py` 按主题**创建**项目文件夹
2. **补齐** brief、script、prompt、subtitle、voiceover、SEO 和 manifest（控制台可辅助）
3. 在 LiblibAI **生成关键帧**
4. 在 PixVerse V6 和即梦 AI **生成视频镜头**
5. 把素材**放回**项目目录
6. **运行** FFmpeg 流水线（`full_pipeline.sh`）
7. **检查**成片，必要时用 CapCut 微调，发布时勾选 AI 内容标注

**系统内置的生产规则：**
- 不要让 AI 视频平台直接生成汉字、拼音或字幕 —— 所有文字一律后期叠加
- 优先使用 Image-to-Video 以提高角色一致性
- 角色身份块必须原文粘贴
- 导出统一为竖版 `1080x1920`、`30fps`、`H.264 MP4`、45–55 秒
- 上传 YouTube Studio 时必须勾选 AI 合成内容标注

## 🗺️ 状态

公开持续开发中。当前可用：项目生成、6 模块控制台（脱机 `localStorage`）、提示词模板、完整 FFmpeg 流水线（已通过 JS/Python/Shell 语法校验）。规划中：

- 浏览器与磁盘项目文件双向同步
- 可视化时间线编辑与 manifest 持久化
- 更好的可复用素材预览
- 可选自动化集成（n8n / 发布平台）

## 🤝 联系 / 关于

由 **Tony (Sheng)** 开发 —— 一名拥有 6000+ 学员的中文老师，公开打造 AI + 中文教学工具。

如果对你有用，欢迎 **⭐ Star 本仓库并 [关注 @shengdabai](https://github.com/shengdabai)**。欢迎 Issue 和 PR —— 模板、FFmpeg 转场、Prompt Builder 逻辑、本地化都是很好的切入点。

**相关项目：** `ai-video-workflow` · `content-creator-hub` · `ai-video-generator`

## 开源协议

[MIT](./LICENSE) © Tony (Sheng)
