#!/bin/bash

# Git 数据分析脚本
# 用于收集代码评估报告所需的 Git 统计数据

# 默认时间范围：两周
SINCE_DATE=${1:-"2 weeks ago"}
UNTIL_DATE=${2:-"now"}

echo "================================================"
echo "📊 Git 数据分析报告"
echo "分析范围: $SINCE_DATE ~ $UNTIL_DATE"
echo "================================================"
echo ""

# 1. 提交次数统计
echo "📝 提交统计"
echo "----------------------------------------"
TOTAL_COMMITS=$(git log --since="$SINCE_DATE" --until="$UNTIL_DATE" --oneline | wc -l | tr -d ' ')
echo "总提交次数: $TOTAL_COMMITS"

AI_COMMITS=$(git log --since="$SINCE_DATE" --until="$UNTIL_DATE" --oneline --grep="\[AI\]" | wc -l | tr -d ' ')
echo "AI 标记提交: $AI_COMMITS"

if [ "$TOTAL_COMMITS" -gt 0 ]; then
    AI_RATIO=$((AI_COMMITS * 100 / TOTAL_COMMITS))
    echo "AI 提交占比: ${AI_RATIO}%"
fi
echo ""

# 2. 代码变更统计
echo "📝 代码变更统计"
echo "----------------------------------------"
git log --since="$SINCE_DATE" --until="$UNTIL_DATE" --numstat --format="" | \
awk 'BEGIN {add=0; del=0} 
     {if ($1 != "-") add+=$1; if ($2 != "-") del+=$2} 
     END {print "新增行数: +" add; print "删除行数: -" del; print "净增行数: " add-del}'
echo ""

# 3. 涉及文件统计
echo "📝 涉及文件统计"
echo "----------------------------------------"
FILE_COUNT=$(git log --since="$SINCE_DATE" --until="$UNTIL_DATE" --name-only --format="" | sort -u | grep -v '^$' | wc -l | tr -d ' ')
echo "涉及文件数: $FILE_COUNT"
echo ""

# 4. 文件类型分布
echo "📝 文件类型分布"
echo "----------------------------------------"
git log --since="$SINCE_DATE" --until="$UNTIL_DATE" --name-only --format="" | sort -u | grep -v '^$' | while read file; do
    echo "$file"
done | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -10
echo ""

# 5. AI 代码标记统计
echo "📝 AI 代码标记统计"
echo "----------------------------------------"
AI_MARKER_COUNT=$(grep -r "@ai-generated" --include="*.tsx" --include="*.ts" --include="*.jsx" --include="*.js" src/ 2>/dev/null | wc -l | tr -d ' ')
echo "@ai-generated 标记数: $AI_MARKER_COUNT"
echo ""

# 6. 提交者统计
echo "📝 提交者统计"
echo "----------------------------------------"
git log --since="$SINCE_DATE" --until="$UNTIL_DATE" --format="%an" | sort | uniq -c | sort -rn
echo ""

# 7. 按日期统计
echo "📝 每日提交趋势"
echo "----------------------------------------"
git log --since="$SINCE_DATE" --until="$UNTIL_DATE" --format="%ad" --date=short | sort | uniq -c
echo ""

# 8. AI 提交详情
echo "📝 AI 标记提交列表"
echo "----------------------------------------"
git log --since="$SINCE_DATE" --until="$UNTIL_DATE" --oneline --grep="\[AI\]"
echo ""

echo "================================================"
echo "✅ 分析完成"
echo "================================================"
