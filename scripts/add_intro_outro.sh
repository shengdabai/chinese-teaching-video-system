#!/bin/bash
# 添加片头片尾脚本
# 用法: bash scripts/add_intro_outro.sh <project_id>

set -euo pipefail

PROJECT_ID="${1:-}"
if [ -z "$PROJECT_ID" ]; then
    echo "❌ 用法: bash scripts/add_intro_outro.sh <project_id>"
    exit 1
fi

PROJECT_DIR="projects/$PROJECT_ID"
MAIN_VIDEO="$PROJECT_DIR/output/rough_cut_with_audio.mp4"
INTRO="assets/brand/intro/intro_1s.mp4"
OUTRO="assets/brand/outro/cta_3s.mp4"
FINAL_OUTPUT="$PROJECT_DIR/output/final_${PROJECT_ID}.mp4"
LOG_DIR="$PROJECT_DIR/logs"
CONCAT_LIST="$LOG_DIR/final_concat.txt"

mkdir -p "$LOG_DIR"

if [ ! -f "$MAIN_VIDEO" ]; then
    echo "❌ 找不到主视频: $MAIN_VIDEO"
    exit 1
fi

echo "🎞️  添加片头片尾..."

: > "$CONCAT_LIST"

if [ -f "$INTRO" ]; then
    echo "file '../../../$INTRO'" >> "$CONCAT_LIST"
fi

echo "file '../../../$MAIN_VIDEO'" >> "$CONCAT_LIST"

if [ -f "$OUTRO" ]; then
    echo "file '../../../$OUTRO'" >> "$CONCAT_LIST"
fi

ffmpeg -y -f concat -safe 0 -i "$CONCAT_LIST" \
    -c:v libx264 -preset slow -crf 18 \
    -c:a aac -b:a 192k \
    -pix_fmt yuv420p \
    -movflags +faststart \
    "$FINAL_OUTPUT" \
    2>"$LOG_DIR/add_intro_outro.log"

DURATION="$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$FINAL_OUTPUT")"
echo "✅ 最终成片: $FINAL_OUTPUT"
echo "⏱️  总时长: ${DURATION}秒"

python3 - <<PY
duration = float("$DURATION")
if duration > 60:
    print("⚠️  警告：视频时长超过60秒！YouTube Shorts要求≤60秒")
PY
