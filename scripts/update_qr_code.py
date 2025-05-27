import qrcode

# رابط الموقع الخاص بك
url = "https://ali-khateb-1.github.io/-Innovation_Hub/"

# إنشاء `QR Code`
qr = qrcode.make(url)

# حفظ الصورة داخل المستودع
qr_path = "/mnt/c/Users/ali/Desktop/Innovation_Hub_New/archive/site/Innovation_Hub_QR.png"
qr.save(qr_path)

# مسار README.md
readme_path = "/mnt/c/Users/ali/Desktop/Innovation_Hub_New/archive/site/README.md"

# قراءة المحتوى الحالي للحفاظ عليه
with open(readme_path, "r", encoding="utf-8") as file:
    content = file.read()

# إضافة `QR Code` إلى `README.md`
qr_code_section = f"\n\n## 🔹 QR Code for Easy Access\n![QR Code](Innovation_Hub_QR.png)\n\n🔗 [Visit the site]({url})"

updated_content = content + qr_code_section

# حفظ التحديثات في `README.md`
with open(readme_path, "w", encoding="utf-8") as file:
    file.write(updated_content)

print("✅ README.md updated successfully with QR Code!")
