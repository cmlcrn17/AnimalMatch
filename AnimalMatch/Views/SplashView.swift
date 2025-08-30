import SwiftUI

/// Simple splash screen displaying the logo before showing the home view.
struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        Group {
            if isActive {
                HomeView()
            } else {
                VStack {
                    Text("AnimalMatch")
                        .font(.largeTitle)
                        .bold()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.orange.opacity(0.3))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(AppSettings.shared)
    }
}
