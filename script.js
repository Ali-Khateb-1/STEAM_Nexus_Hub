// 🚀 script.js - التحكم بالموقع وإدارة الوظائف الديناميكية

// وظيفة إعادة توجيه المستخدم بناءً على اختياره
function redirectUser(role) {
    if (role === 'user') {
        window.location.href = "user-dashboard.html";
    } else {
        window.location.href = "developer-dashboard.html";
    }
}

// وظيفة توليد الباركود - تجربة تحليل المحتوى الذكي
function generateBarcode() {
    document.getElementById("barcode-container").innerHTML = "<p>📌 تم إنشاء باركود مخصص لهذه الصفحة! يمكنك حفظه أو مسحه ضوئيًا.</p>";
}

// تشغيل الوظائف عند تحميل الصفحة
document.addEventListener("DOMContentLoaded", function() {
    console.log("🚀 الموقع جاهز للعمل!");
});
