import Foundation

/// Application wide settings stored in `UserDefaults`.
final class AppSettings: ObservableObject {
    static let shared = AppSettings()

    @Published var soundEnabled: Bool {
        didSet { UserDefaults.standard.set(soundEnabled, forKey: "soundEnabled") }
    }

    @Published var musicEnabled: Bool {
        didSet { UserDefaults.standard.set(musicEnabled, forKey: "musicEnabled") }
    }

    @Published var highScore: Int {
        didSet { UserDefaults.standard.set(highScore, forKey: "highScore") }
    }

    private init() {
        self.soundEnabled = UserDefaults.standard.object(forKey: "soundEnabled") as? Bool ?? true
        self.musicEnabled = UserDefaults.standard.object(forKey: "musicEnabled") as? Bool ?? true
        self.highScore = UserDefaults.standard.object(forKey: "highScore") as? Int ?? 0
    }
}
