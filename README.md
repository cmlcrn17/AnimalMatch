# 🐾 AnimalMatch

## English
AnimalMatch is a casual SwiftUI memory game where players flip animal cards to find matching pairs. The game uses a simple MVVM architecture and is optimized for iPhone screens.

### Features
- 3x3 grid of animal emoji cards for the first level (scales up to 6x6).
- Flip animations with scoring and timer.
- Bonus points for quick matches, small penalty for wrong guesses.
- Local high score saved with `UserDefaults`.
- Simple settings to toggle sound effects and background music.
- Placeholder audio manager ready for future asset integration.

### Structure
- `Models` – data models such as `Card` and `AppSettings`.
- `ViewModels` – `GameViewModel` containing game logic.
- `Views` – SwiftUI views (`HomeView`, `GameView`, `CardView`, etc.).
- `Resources` – audio manager and future asset placeholders.

### Running
Open the project in Xcode 15 or later and run on an iOS 15+ simulator or device. Replace emoji with real images by adding them to the asset catalog and updating the model.

## Türkçe
AnimalMatch, oyuncuların hayvan kartlarını çevirerek eşleşen çiftleri bulmaya çalıştığı, SwiftUI ile geliştirilmiş rahat bir hafıza oyunudur. Oyun, iPhone ekranları için optimize edilmiş basit bir MVVM mimarisi kullanır.

### Özellikler
- İlk seviyede 3x3 boyutunda hayvan emojilerinden oluşan bir ızgara (6x6'ya kadar ölçeklenebilir).
- Skor ve zamanlayıcıya sahip kart çevirme animasyonları.
- Hızlı eşleşmeler için bonus puan, yanlış tahminler için küçük ceza.
- `UserDefaults` ile saklanan yerel en yüksek skor.
- Ses efektleri ve arka plan müziğini açıp kapatmak için basit ayarlar.
- Gelecekteki varlık entegrasyonu için hazır bekleyen ses yöneticisi.

### Yapı
- `Models` – `Card` ve `AppSettings` gibi veri modelleri.
- `ViewModels` – oyun mantığını içeren `GameViewModel`.
- `Views` – SwiftUI görünümleri (`HomeView`, `GameView`, `CardView`, vb.).
- `Resources` – ses yöneticisi ve gelecekteki varlık yer tutucuları.

### Çalıştırma
Projeyi Xcode 15 veya üzeri sürümlerde açın ve iOS 15+ simülatörde veya cihazda çalıştırın. Emojileri gerçek görsellerle değiştirmek için varlık kataloğuna ekleyip modeli güncelleyin.
