// Audio playback is available on Apple platforms via AVFoundation.
#if canImport(AVFoundation)
import AVFoundation

/// Manages background music and sound effects.
final class AudioManager {
    static let shared = AudioManager()
    private var backgroundPlayer: AVAudioPlayer?
    private var effectPlayer: AVAudioPlayer?

    private init() {}

    /// Plays a looping background track if enabled in settings.
    func playBackgroundMusic() {
        guard AppSettings.shared.musicEnabled else { return }
        guard let url = Bundle.main.url(forResource: "background", withExtension: "mp3") else { return }
        backgroundPlayer = try? AVAudioPlayer(contentsOf: url)
        backgroundPlayer?.numberOfLoops = -1
        backgroundPlayer?.play()
    }

    /// Stops the background music.
    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }

    /// Plays a short sound effect on successful match.
    func playMatchSound() {
        guard AppSettings.shared.soundEnabled else { return }
        guard let url = Bundle.main.url(forResource: "match", withExtension: "wav") else { return }
        effectPlayer = try? AVAudioPlayer(contentsOf: url)
        effectPlayer?.play()
    }
}
#else
/// Fallback audio manager used when AVFoundation is unavailable.
/// Provides no-op implementations so the package builds on platforms
/// that don't support audio playback.
final class AudioManager {
    static let shared = AudioManager()
    private init() {}

    func playBackgroundMusic() {}
    func stopBackgroundMusic() {}
    func playMatchSound() {}
}
#endif
