import base64

image_path = "/mnt/c/Users/ali/Downloads/Copilot_20250622_043303.png"
output_path = "GitGate_Logo_Embed.html"

with open(image_path, "rb") as img:
    encoded = base64.b64encode(img.read()).decode("utf-8")

html = f"""
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>Git Gate Logo</title></head>
<body style="margin:0;background:#101010;display:flex;align-items:center;justify-content:center;height:100vh;">
<img src="data:image/png;base64,{encoded}" style="max-width:400px;filter:drop-shadow(0 0 16px #ff9500);" />
</body></html>
"""

with open(output_path, "w", encoding="utf-8") as f:
    f.write(html)
