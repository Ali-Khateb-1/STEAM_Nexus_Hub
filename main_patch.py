import os, subprocess

root_path = r'/mnt/c/Users/ali/Desktop/STEAM_Nexus_Hub'

for folder_path, _, files in os.walk(root_path):
    for file in files:
        if file.endswith("_patch.py"):
            patch_path = os.path.join(folder_path, file)
            update_path = patch_path.replace("_patch.py", "_update.html")

            # تشغيل التحديث فقط إذا كان هناك تغيير
            if os.path.exists(update_path):
                with open(update_path, "r", encoding="utf-8") as f:
                    if f.read().strip():
                        subprocess.run(["python", patch_path], check=False)
                        print(f"🚀 تشغيل التحديث لـ {file.replace('_patch.py', '')}")
