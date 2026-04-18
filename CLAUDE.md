# Chinese Teaching Video Production System

## 项目用途
用固定卡通熊猫IP形象制作AI中文教学短视频，发布YouTube Shorts，目标受众是学中文的外国人。

## 技术栈
- 脚本/文案：Claude / ChatGPT
- 静态图：LiblibAI
- 视频生成：PixVerse V6（主）/ 即梦AI（辅）
- 自动剪辑：FFmpeg（主引擎）
- 最终美化：剪映/CapCut
- 工作流编排：n8n（可选）
- 控制台：纯前端HTML/CSS/JS

## 核心规则
1. 所有视频中的汉字、拼音、英文翻译必须后期叠加，绝不让AI视频平台生成文字
2. 视频生成优先使用Image-to-Video模式（先出图再出视频）
3. 角色描述使用固定的Character Identity Block，逐字复制不改动
4. 导出标准：9:16竖版、1080x1920、30fps、H.264 MP4、45-55秒
5. 每条视频必须在YouTube Studio标注AI合成内容

## 关键文件
- config/character_sheet.md — 角色锚定文件
- templates/ — 所有模板文件
- scripts/ — 自动化脚本
- console/ — Web控制台

## 命令
- `python scripts/generate_project.py "主题"` — 生成新项目
- `bash scripts/full_pipeline.sh 项目文件夹名` — 一键剪辑出片
- `python scripts/quality_check.py 项目文件夹名` — 质量检查
