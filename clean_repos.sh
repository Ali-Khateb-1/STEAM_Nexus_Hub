#!/bin/bash

repos=(
  "STEAM_Nexus_Hub"
  "STEAM_Nexus_Switchers_Lab"
  "STEAM-Forge"
  "STEAM_Data_Manager"
  "my-online-store"
)

github_user="Ali-Khateb-1"
workdir="$HOME/Desktop/git-clean-temp"
mkdir -p "$workdir"
cd "$workdir" || exit 1

for repo in "${repos[@]}"; do
  echo "🔧 جاري تفريغ $repo ..."
  git clone "https://github.com/${github_user}/${repo}.git"
  cd "$repo" || continue
  find . -mindepth 1 ! -regex '^./\.git\(/.*\)?' ! -name 'index.html' -delete
  if [ -f index.html ]; then
    git add -A
    git commit -m "🧹 تفريغ المستودع بالكامل مع الاحتفاظ بـ index.html فقط"
    git push origin main
    echo "✅ تم تفريغ $repo بنجاح"
  else
    echo "⚠️ لم يتم العثور على index.html في $repo — لم يتم تنفيذ تفريغ"
  fi
  cd "$workdir"
done

