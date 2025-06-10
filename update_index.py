
import os

root_path = "/mnt/c/Users/ali/Desktop/STEAM_Nexus_Hub"
index_path = os.path.join(root_path, "index.html")

# البحث عن جميع ملفات HTML داخل المجلدات الفرعية
html_files = []
for folder_path, _, files in os.walk(root_path):
    for file in files:
        if file.endswith(".html") and file.lower() != "index.html":  # استثناء index الرئيسي
            relative_path = os.path.relpath(os.path.join(folder_path, file), root_path)
            html_files.append(relative_path)

# إنشاء قائمة تنقل ديناميكية صحيحة
nav_links = "<nav><h3>🔗 الصفحات المتاحة</h3><ul>"
for page in sorted(html_files):
    nav_links += f"<li><a href='{page}'>{page}</a></li>"
nav_links += "</ul></nav>"

# تحديث index.html بالقائمة الجديدة
if os.path.exists(index_path):
    with open(index_path, "r", encoding="utf-8") as f:
        old_index = f.read()
    
    updated_index = f"{nav_links}<div style='opacity:0.8; margin-top:20px;'>{old_index}</div>"
    
    with open(index_path, "w", encoding="utf-8") as f:
        f.write(updated_index)

    print("✅ تم تحديث قائمة الصفحات داخل index.html")
else:
    print("❗ لم يتم العثور على index.html")
