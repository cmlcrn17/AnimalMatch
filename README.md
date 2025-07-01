# 🐾 AnimalMatch – iOS Kart Eşleşme Oyunu

# 🎯 Proje Amacı
AnimalMatch, iOS cihazlar için geliştirilen, hayvan temalı kartların eşleştirilmesine dayalı bir hafıza oyunudur. Oyuncular kartları çevirerek aynı hayvan çiftlerini bulmaya çalışır. Her doğru eşleşme puan kazandırırken, yanlış eşleşmeler puan kaybettirir. Oyun sonunda kullanıcıların skorları Firebase veritabanına kaydedilir. Oyuna giriş, Google hesabı ile yapılır. Bu sayede kullanıcıya özel skor takibi sağlanır.

Proje, hem kullanıcı arayüzü tasarımı hem de backend entegrasyonu (Firebase + Google Sign-In) açısından iOS geliştiricileri için eğitici ve gerçek dünyaya yakın bir uygulama deneyimi sunar.


![ExampleUI](https://github.com/cmlcrn17/AnimalMatch/blob/main/AnimalMatchExampleUI.png)


# 📦 Proje İçeriği
## 🔹 Oyun Özellikleri
* 3x4 düzeninde 12 kart (6 hayvan çifti)

* Kartlara dokunarak çevirme

* Doğru eşleşmede kartların sabitlenmesi

* Yanlış eşleşmede kartların geri dönmesi

* Oyun süresi: 60 saniye

Skor sistemi:

* ✅ +10 puan doğru eşleşme

* ❌ –5 puan yanlış eşleşme

* ⏱ Bonus: kalan süreden ek puan

* Oyun sonunda skor ekranı

🔹 Giriş Sistemi
* Google hesabı ile giriş yapılır

* Firebase Authentication kullanılır

* Her oyuncu kendi skor geçmişini görebilir

🔹 Skor Takibi
* Firebase Firestore ile oyuncu skorları saklanır

* Her skor şu bilgileri içerir:

* Skor puanı

* Kalan süre

* Tarih ve saat

* Gelecekte istatistik ekranı oluşturulabilir

🔹 Arayüz ve Tema
* SwiftUI ile sade, kullanıcı dostu arayüz

* Renkli ve eğlenceli hayvan görselleri

* Opsiyonel olarak basit animasyon ve ses efektleri

📁 Kullanılan Teknolojiler
* Swift (SwiftUI)

* Firebase Authentication (Google Sign-In)

* Firebase Firestore

* MVVM mimarisi

* Apple Swift Package Manager (Firebase SDK)
