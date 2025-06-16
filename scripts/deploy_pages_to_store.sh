#!/bin/bash

SOURCE_ROOT="."
DEST_ROOT="./my-online-store"
EXTENSIONS="html css js png jpg jpeg gif svg"

echo "بدء جلب الصفحات الجديدة من جميع المستويات..."
mkdir -p "$DEST_ROOT"

find "$SOURCE_ROOT" \( $(echo $EXTENSIONS | sed 's/[^ ]*/-iname "*.&"/g') \) \
  -type f \
  -not -path "$DEST_ROOT/*" \
  -not -path "*/.git/*" \
  -not -path "*/__pycache__/*" \
  -not -path "*/env/*" \
  -not -path "*/.venv/*" \
  -not -path "*/node_modules/*" \
  | while read file; do
    relative_path="${file#$SOURCE_ROOT/}"
    destination="$DEST_ROOT/$relative_path"
    mkdir -p "$(dirname "$destination")"
    cp -u "$file" "$destination"
done

echo "✅ جلب كل الصفحات المضافة حديثًا إلى: $DEST_ROOT"
