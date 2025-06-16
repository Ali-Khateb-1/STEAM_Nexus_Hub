#!/bin/bash

echo "🔧 بدء مزامنة المستودعات من الجذر: STEAM_Nexus_Hub"
cd /mnt/c/Users/ali/Desktop/STEAM_Nexus_Hub

# جميع المسارات حسب الاكتشاف
repos=(
  "my-online-store"
  "STEAM_Nexus_Switchers_Lab"
  "STEAM_Nexus_Switchers_Lab/STEAM-Forge"
  "STEAM_Nexus_Switchers_Lab/STEAM-Forge/STEAM_Data_Manager"
)

for path in "${repos[@]}"; do
  if [ -d "$path/.git" ]; then
    echo "🔁 مزامنة: $path"
    cd "$path"

    git add .
    git commit -m "🔄 مزامنة تلقائية لـ $path" || echo "🟡 لا تغييرات جديدة في $path"
    git push || echo "❌ تعذر الدفع لـ $path. تحقق من الاتصال أو remote."
    
    cd - > /dev/null
  else
    echo "⚠️ لا يوجد .git في: $path"
  fi
done

echo "✅ انتهت عملية المزامنة الجماعية"
