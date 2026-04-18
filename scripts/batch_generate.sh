#!/bin/bash
# 批量项目生成脚本
# 用法: bash scripts/batch_generate.sh topics.txt
# topics.txt 格式（每行一个主题）:
#   谢谢|Thank You|beginner|A_55s|cute|DailyMandarin|learn chinese thank you

set -euo pipefail

TOPICS_FILE="${1:-}"
if [ -z "$TOPICS_FILE" ] || [ ! -f "$TOPICS_FILE" ]; then
    echo "❌ 用法: bash scripts/batch_generate.sh <topics_file>"
    echo "   topics.txt格式: 中文主题|英文主题|人群|模板|风格|系列标签|SEO关键词"
    exit 1
fi

echo "📦 批量生成项目..."

count=0
while IFS='|' read -r topic_cn topic_en audience template style series seo; do
    [ -z "$topic_cn" ] && continue
    [[ "$topic_cn" == \#* ]] && continue

    echo ""
    echo "━━━ 生成: $topic_cn / $topic_en ━━━"

    printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n" \
        "$topic_cn" \
        "$topic_en" \
        "$audience" \
        "$template" \
        "$style" \
        "$series" \
        "$seo" | python3 scripts/generate_project.py

    count=$((count + 1))
done < "$TOPICS_FILE"

echo ""
echo "✅ 批量生成完成！共创建 $count 个项目"
