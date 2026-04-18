# 中文教学短视频生产系统

[English README](./README.md)

这是一个围绕固定熊猫 IP 角色打造的 AI 中文教学动画短视频标准化生产系统，适合制作并批量管理 YouTube Shorts 中文教学内容。项目把选题、脚本、提示词、素材管理、FFmpeg 自动剪辑、SEO 包装和发布前检查串成了一套可复用工作流。

## 这个项目包含什么
- 固定角色身份锚定系统，尽量降低角色漂移
- LiblibAI、PixVerse V6、即梦 AI 的提示词模板
- 自动生成单条视频项目文件夹的脚本
- 用于预处理、自动剪辑、字幕烧录、音频混合和最终拼接的 Shell / Python 脚本
- 一个纯前端网页控制台，直接打开 `console/index.html` 就能使用
- 配套的工作流、平台操作、FFmpeg、排错和 YouTube SEO 文档

## 标准使用流程
1. 用 `scripts/generate_project.py` 按主题生成一个新项目
2. 在 `projects/<project_id>/` 下补完脚本和提示词文件
3. 去 LiblibAI 生成关键帧
4. 去 PixVerse V6 和即梦 AI 生成镜头视频
5. 把素材放回项目目录
6. 运行 FFmpeg 自动流水线
7. 检查 SEO 和发布项，然后上传到 YouTube Shorts

## 目录结构
```text
chinese-teaching-video-system/
├── config/      # 角色、品牌、导出和平台配置
├── templates/   # 脚本、提示词、字幕、SEO、manifest 模板
├── scripts/     # 项目生成与后期自动化脚本
├── assets/      # 可复用素材和占位目录
├── projects/    # 每条视频一个项目目录
├── console/     # 浏览器控制台
└── docs/        # 工作流和参考文档
```

## 快速开始

### 1. 进入项目目录
```bash
cd /Users/adam/Desktop/chinese-teaching-video-system
```

### 2. 创建一个新项目
```bash
python3 scripts/generate_project.py
```

### 3. 打开网页控制台
用浏览器打开 [console/index.html](./console/index.html)。

控制台可以帮助你：
- 录入主题和生产参数
- 导入和编辑 `02_script.json`
- 自动拼接图片和视频提示词
- 跟踪每个镜头的状态
- 导入 `10_edit_manifest.json`
- 生成 FFmpeg 命令和发布资料

### 4. 运行完整流水线
```bash
bash scripts/full_pipeline.sh <project_id>
```

### 5. 运行质量检查
```bash
python3 scripts/quality_check.py <project_id>
```

## 核心文件
- [CLAUDE.md](./CLAUDE.md)：后续协作会话的项目指令
- [PROJECT_SPEC.md](./PROJECT_SPEC.md)：完整需求说明
- [config/character_sheet.md](./config/character_sheet.md)：角色身份锚定文件
- [docs/workflow_guide.md](./docs/workflow_guide.md)：完整工作流指南
- [docs/platform_guide.md](./docs/platform_guide.md)：平台操作指南

## 网页控制台模块
1. Topic Intake
2. Script Engine
3. Prompt Pack Builder
4. Clip Inbox & Asset Manager
5. Auto Editor
6. Publish Dashboard

## 推荐生产规则
- 汉字、拼音、英文翻译一律后期叠加，不要让 AI 视频平台直接生成
- 优先使用 Image-to-Video 流程
- 角色身份块必须原文粘贴
- 输出统一为 `1080x1920`、`30fps`、`H.264 MP4`
- 上传到 YouTube Studio 时必须勾选 AI 合成内容标注

## 文档入口
- [完整工作流指南](./docs/workflow_guide.md)
- [平台操作指南](./docs/platform_guide.md)
- [FFmpeg 速查](./docs/ffmpeg_cheatsheet.md)
- [常见问题排查](./docs/troubleshooting.md)
- [YouTube SEO 指南](./docs/youtube_seo_guide.md)

## 说明
- 网页控制台的数据保存在浏览器 `localStorage`
- 控制台不会直接运行 AI 平台或 FFmpeg，它负责组织和管理流程
- 原始素材、背景音乐、字体文件和后续生成的项目输出默认不纳入 Git 版本控制
