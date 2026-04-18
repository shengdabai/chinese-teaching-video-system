# Chinese Teaching Video System

[中文说明](./README_CN.md)

An end-to-end production system for AI-generated Chinese teaching animation shorts built around a fixed panda character IP. It standardizes topic intake, scripting, prompt generation, asset tracking, FFmpeg-based editing, SEO packaging, and publishing workflows for YouTube Shorts.

## What This Project Includes
- A fixed character identity system to reduce visual drift across generations
- Prompt templates for LiblibAI, PixVerse V6, and Jimeng AI
- Project generators for creating repeatable per-video workspaces
- Shell and Python scripts for clip normalization, auto-editing, subtitle burn-in, audio mixing, and final assembly
- A pure frontend web console that runs by opening `console/index.html` directly in the browser
- Documentation for workflow, platform usage, FFmpeg, troubleshooting, and YouTube SEO

## Typical Workflow
1. Create a new project from a topic using `scripts/generate_project.py`
2. Fill in the project files under `projects/<project_id>/`
3. Generate keyframes in LiblibAI
4. Generate clips in PixVerse V6 and Jimeng AI
5. Drop raw assets into the project folders
6. Run the FFmpeg pipeline
7. Review SEO and publish with AI-content disclosure enabled

## Project Structure
```text
chinese-teaching-video-system/
├── config/      # Character, brand, export, and platform config
├── templates/   # Reusable templates for scripts, prompts, subtitles, SEO, manifests
├── scripts/     # Automation scripts for project generation and post-production
├── assets/      # Reusable assets and placeholder asset directories
├── projects/    # Per-video project folders and example project
├── console/     # Browser-based production console
└── docs/        # Workflow and reference documentation
```

## Quick Start

### 1. Open the project
```bash
cd /Users/adam/Desktop/chinese-teaching-video-system
```

### 2. Generate a project folder
```bash
python3 scripts/generate_project.py
```

### 3. Open the web console
Open [console/index.html](./console/index.html) in your browser.

The console helps you:
- define a topic and production plan
- import and edit `02_script.json`
- build prompts for image and video generation
- track shot progress in a kanban board
- import `10_edit_manifest.json`
- prepare FFmpeg commands and publishing metadata

### 4. Run the full pipeline
```bash
bash scripts/full_pipeline.sh <project_id>
```

### 5. Run quality checks
```bash
python3 scripts/quality_check.py <project_id>
```

## Core Files
- [CLAUDE.md](./CLAUDE.md): working instructions for future coding sessions
- [PROJECT_SPEC.md](./PROJECT_SPEC.md): full product specification
- [config/character_sheet.md](./config/character_sheet.md): locked character identity block
- [docs/workflow_guide.md](./docs/workflow_guide.md): full workflow guide
- [docs/platform_guide.md](./docs/platform_guide.md): PixVerse, Jimeng, and Liblib usage guide

## Web Console Modules
1. Topic Intake
2. Script Engine
3. Prompt Pack Builder
4. Clip Inbox & Asset Manager
5. Auto Editor
6. Publish Dashboard

## Recommended Production Rules
- Never let AI video platforms render Chinese characters, pinyin, or English subtitles directly in-scene
- Use Image-to-Video first whenever possible
- Paste the character identity block verbatim into prompts
- Keep output vertical at `1080x1920`, `30fps`, `H.264 MP4`
- Always disclose altered or synthetic content in YouTube Studio

## Documentation
- [Workflow Guide](./docs/workflow_guide.md)
- [Platform Guide](./docs/platform_guide.md)
- [FFmpeg Cheatsheet](./docs/ffmpeg_cheatsheet.md)
- [Troubleshooting](./docs/troubleshooting.md)
- [YouTube SEO Guide](./docs/youtube_seo_guide.md)

## Notes
- The web console stores its working state in browser `localStorage`
- The console does not execute AI generation or FFmpeg directly; it orchestrates and manages the workflow
- User-generated assets such as raw clips, BGM, fonts, and local project outputs are intentionally ignored by Git
