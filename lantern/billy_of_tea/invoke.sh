#!/bin/bash

# ┌────────────────────────────────────────────┐
# │  ☕ سكربت "بيلي أوف تي" — أبريق الشاي      │
# │  لا يُستخدم... بل يُستَحضر                 │
# │  يلتقط الصفحات التي تنفست ولم تُطلب       │
# └────────────────────────────────────────────┘

SOURCE_ROOT="."
EXT="html css js"
DEST_DIR="my-online-store/ephemeral"
LOG_FILE="my-online-store/.billy_tea.log"
TIMESPAN_MINUTES=90  # عدد الدقائق الماضية التي تُعتبر "تحديث حديث"

echo "🫖 استدعاء بيلي أوف تي..."
echo "⏳ يبحث عن صفحات وُلدت خلال الـ $TIMESPAN_MINUTES دقيقة الماضية..."

mkdir -p "$DEST_DIR"

# تحويل الامتدادات إلى نمط بحث
pattern=$(echo $EXT | sed 's/[^ ]*/-iname "*.&"/g')

# البحث والتجميع
found=0
find "$SOURCE_ROOT" \( $pattern \) \
  -type f -mmin -"$TIMESPAN_MINUTES" \
  -not -path "./$DEST_DIR/*" \
  -not -path "*/.git/*" \
  -not -path "*/env/*" \
  -not -path "*/__pycache__/*" \
  -not -path "*/node_modules/*" \
  | while read file; do
    rel="${file#$SOURCE_ROOT/}"
    dest="$DEST_DIR/$rel"
    mkdir -p "$(dirname "$dest")"
    cp -u "$file" "$dest"
    echo "$(date +%F\ %T) + $rel" >> "$LOG_FILE"
    ((found++))
done

if [[ $found -eq 0 ]]; then
  echo "😶 لم يُحضر بيلي شيئًا هذه المرة... وكأن الشاي فتر."
else
  echo "🌬️ حضر $found صفحة — بعضها موجة، وبعضها نسمة."
  echo "🕯️ أُدرجت في سجل: $LOG_FILE"
fi

echo "📜 انتهى بيلي... وعاد إلى الأبريق."
