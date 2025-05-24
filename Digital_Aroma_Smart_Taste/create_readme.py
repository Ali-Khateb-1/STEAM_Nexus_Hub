import os
import time
import shutil
import logging

# تعريف المتغيرات التي ستُكوّن محتوى README
title = "# Digital Aroma Smart Taste"
intro = "This project aims to integrate advanced AI for digital aroma and intelligent taste analysis."
objectives = ("## Objectives\n"
              "- Develop a robust AI model for image classification.\n"
              "- Integrate data fusion and strategic marketing techniques.\n"
              "- Ensure systematic documentation and backups.")

# تجميع المحتوى في سلسلة واحدة (يمكن تعديل التنسيق حسب الحاجة)
readme_content = f"{title}\n\n{intro}\n\n{objectives}\n"

# تحديد مسار حفظ ملف README.md
readme_path = "/mnt/c/Users/ali/Desktop/Digital_Aroma_Smart_Taste/README.md"

# فتح الملف بوضع الكتابة (w)؛ إذا كان موجودًا يستبدله بالمحتوى الجديد
with open(readme_path, "w", encoding="utf-8") as file:
    file.write(readme_content)

print(f"README file created at: {readme_path}")
