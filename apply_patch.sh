#!/bin/bash

old_content=""
if [ -f "index.html" ]; then
    old_content=$(cat "index.html")
fi

echo "<html>
<head><title>الرئيسية - STEAM_Nexus_Hub</title></head>
<body>
<header>
  <h1>STEAM Nexus Hub</h1>
</header>

<section>
  <h2>التحديثات الأخيرة</h2>
  $(cat "updates.html")
</section>

<hr>

<section>
  <h2>المحتوى السابق</h2>
  $old_content
</section>

<h2>التنقل بين المستودعات</h2>
<ul>
  <li><a href='../index.html'>الرئيسية</a></li>
  <li><a href='../STEAM_Nexus_Switchers_Lab/updates.html'>Switchers Lab</a></li>
  <li><a href='../STEAM_Nexus_Switchers_Lab/STEAM-Forge/updates.html'>Forge</a></li>
  <li><a href='../STEAM_Nexus_Switchers_Lab/STEAM-Forge/STEAM_Data_Manager/updates.html'>Data Manager</a></li>
  <li><a href='../my-online-store/updates.html'>متجر إلكتروني</a></li>
</ul>
</body></html>" > "index.html"

git add index.html
git commit -m "تحديث index.html في STEAM_Nexus_Hub"
git push origin main

echo "تم تنفيذ الباتش في STEAM_Nexus_Hub بنجاح!"
