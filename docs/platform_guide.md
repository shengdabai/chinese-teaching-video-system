# 平台操作指南

## 总览
本项目核心使用三个平台：
- PixVerse V6：主视频平台，承担大多数角色镜头
- 即梦 AI：辅助视频平台，承担中式环境与备选镜头
- LiblibAI：关键帧、角色参考图、封面图和表情图

---

## PixVerse V6 操作指南

### 推荐用途
- 主讲角色镜头
- 发音示范镜头
- Hook、Quiz、CTA 等高一致性镜头
- 连续教学镜头的 Multi-Shot 生成

### 推荐参数
- Mode: Image-to-Video
- Model: V6 Standard
- Resolution: 1080p
- Aspect Ratio: 9:16
- Duration: 15s
- Motion Strength: medium-low
- Audio: 环境音可保留，台词以后期配音为主

### 标准步骤
1. 打开 PixVerse V6
2. 选择 `Image-to-Video`
3. 上传本镜头对应的 keyframe 图片
4. 粘贴完整英文 prompt
5. 检查 prompt 首行是否包含完整 Character Identity Block
6. 确认 prompt 内没有任何文字描述，例如 text、caption、subtitle
7. 选择 9:16、1080p、15 秒
8. 先跑 Preview，再决定是否 Full Render
9. 下载后重命名为 `shot_01.mp4` 之类的标准文件名

### Multi-Shot 使用方法
适合 Shot 2 和 Shot 3 这种同场景、同角色、不同景别的连续镜头。

推荐流程：
1. 先在 LiblibAI 生成同场景关键帧
2. 在 PixVerse 中用第一张关键帧生成 Shot 2
3. 用相同角色块和环境描述，轻改动作与机位，生成 Shot 3
4. 如果平台支持 Multi-Shot 或连续镜头编排，优先保持场景一致，仅修改：
   - 动作
   - 景别
   - 镜头运动
5. 不要同时更改服装、背景风格、光线和构图，否则漂移概率上升

### 常见问题
- 角色脸变形：减少 Motion Strength，回到更稳的关键帧
- 服装变色：在 prompt 中再次强调 `red Chinese vest, golden buttons, yellow scarf`
- 画面出现文字：负面 prompt 明确写 `text, words, letters, subtitles`
- 动作太夸张：动作描述改为单一动作，不要堆叠多个连续指令

---

## 即梦 AI 视频 3.5 Pro 操作指南

### 推荐用途
- 中式餐厅、街景、节日、传统文化环境
- 需要更强中式氛围的场景镜头
- PixVerse 失败时的环境备选

### 推荐参数
- 模型：视频 3.5 Pro
- 模式：图生视频优先
- 画幅：竖版 9:16
- 时长：与分镜一致，通常 8 到 15 秒
- 镜头运动：轻微、可控

### 标准步骤
1. 打开即梦 AI
2. 选择视频生成，优先使用图生视频
3. 上传关键帧图
4. 粘贴中文 prompt
5. 明确写环境、动作、镜头角度、镜头运动
6. 再次确认 prompt 中没有任何文字内容描述
7. 输出后下载到 `raw_clips/`

### Prompt 编写建议
- 从中文角色块开始
- 用简单直白的中文写动作
- 对环境描述具体，例如 `中式餐厅，红灯笼，木质家具，暖色室内灯光`
- 不写抽象词，例如 “梦幻”“史诗”“诗意”

### 注意事项
- 即梦在环境表现上更强，但角色一致性通常不如 PixVerse
- 重要角色镜头尽量还是先用 PixVerse
- 即梦更适合切换环境而不是长时间特写人物

---

## LiblibAI 操作指南

### 推荐用途
- 角色参考图
- 镜头关键帧
- 表情图
- 封面图

### 角色参考图最佳实践
先统一生产 6 类角色参考图：
1. 正面定妆
2. 45 度侧面
3. 全身站姿
4. 手部特写
5. 开心表情
6. 思考表情

### 推荐参数
- 风格关键词统一：
  `cartoon style, 3D render, Pixar style, soft lighting, vibrant colors`
- 构图：Vertical composition 9:16
- 单次只改一个变量：姿势、表情或背景

### 生成关键帧的步骤
1. 从 `05_image_prompts.md` 复制 prompt
2. 粘贴完整 Character Identity Block
3. 指定精确动作和背景
4. 检查服装颜色和耳夹是否保持一致
5. 保存命名为 `keyframe_shot[编号]_v1.png`

### 常见问题与解决
- 漂移严重：降低环境复杂度，先用纯背景稳定角色
- 角色比例变化：在 prompt 中重申 `chubby round body with a white belly and black limbs`
- 表情不准确：把表情单独前置，如 `The panda has a surprised expression`

---

## 参数推荐汇总

### PixVerse V6
- 9:16
- 1080p
- 15s
- V6 Standard
- Motion Strength: medium-low

### 即梦 AI
- 9:16
- 视频 3.5 Pro
- 图生视频优先
- 中等以下运动强度

### LiblibAI
- 角色块全量粘贴
- 统一风格关键词
- 竖版构图
- 每次只改一个镜头变量
