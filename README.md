📸 PrivacyScreenCapture
PrivacyScreenCapture is a lightweight Swift Package that helps you detect screenshots and display a customizable privacy warning overlay in iOS apps.
It is designed to be:
✅ Modular
✅ SwiftUI-friendly
✅ UIKit compatible
✅ iOS 13+ supported
✅ Easy to integrate via Swift Package Manager
✨ Features
Detect screenshots in your main app
Display a full-screen privacy warning popup
Fully customizable UI (colors, title, description)
SwiftUI-based UI presented via UIKit
Callback to notify the main app when the popup is dismissed
Supports images and asset catalogs via Bundle.module
📱 Use Case
This module is useful when your app handles sensitive content, such as:
Banking or finance apps
Healthcare apps
Enterprise/internal apps
DRM-protected or confidential data
When a screenshot is taken, you can:
Detect it in the main app
Show a privacy warning popup
React when the user dismisses the popup
📦 Installation
Swift Package Manager (Local or Remote)
Local Package
In Xcode:
File → Add Packages…
Select Add Local…
Choose the PrivacyScreenCapture folder
Remote Package
.package(url: "https://github.com/your-org/PrivacyScreenCapture.git", from: "1.0.0")
Then add it to your target dependencies.
🧱 Architecture Overview
Main App
 ├─ Detects screenshot (UIApplication notification)
 ├─ Configures UI content
 ├─ Presents popup
 └─ Receives dismiss callback

PrivacyScreenCapture (SPM)
 ├─ PrivacyScreenCaptureConfig
 ├─ PrivacyScreenCapturePresenter
 ├─ PrivacyScreenCaptureView (SwiftUI)
 └─ Resource Bundle (Assets.xcassets)
🔒 Screenshot detection is intentionally kept outside the module to give the app full control.
🛠️ Integration Guide
1️⃣ Import the Module
import PrivacyScreenCapture
2️⃣ Detect Screenshot in Main App
Screenshot detection must be done in the main app, not inside the module.
NotificationCenter.default.addObserver(
    forName: UIApplication.userDidTakeScreenshotNotification,
    object: nil,
    queue: .main
) { _ in
    showScreenshotPopup()
}
3️⃣ Present the Privacy Popup
private func showScreenshotPopup() {
    guard let rootVC = UIApplication.shared.topViewController() else {
        print("❌ Could not find root view controller")
        return
    }

    let config = PrivacyScreenCaptureConfig(
        backgroundColor: Color.red.opacity(0.85),
        title: "Screenshot Detected",
        description: "Taking screenshots of this content is not allowed.",
        onDismiss: {
            // Callback from module
            PrivacyScreenCapturePresenter.dismiss()
            print("❌ Screenshot popup closed by user")
        }
    )

    PrivacyScreenCapturePresenter.present(
        on: rootVC,
        config: config
    )
}
🧩 Configuration API
PrivacyScreenCaptureConfig
public struct PrivacyScreenCaptureConfig {
    public let backgroundColor: Color
    public let title: String
    public let description: String
    public let onDismiss: () -> Void
}
Property    Description
backgroundColor Full-screen overlay color
title   Main warning title
description Detailed message
onDismiss   Callback when user taps Close
🖼️ Assets Support
The module supports images using Swift Package resources.
Asset Setup
Sources/
 └─ PrivacyScreenCapture/
    └─ Resources/
       └─ Assets.xcassets
          └─ screenshot_warning.imageset
Usage in SwiftUI
Image("screenshot_warning", bundle: .module)
📱 Demo App Example
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "hand.raised.circle.fill")
                .font(.system(size: 100))
                .foregroundStyle(.tint)
                .tint(.red)

            Text("This module helps to show a privacy screen when a screenshot is taken.")
                .padding()

            Button("Show Screenshot Popup") {
                showScreenshotPopup()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
    }
}
✅ iOS Compatibility
iOS Version Supported
iOS 13+ ✅
SwiftUI ✅
UIKit   ✅
🔐 Design Decisions
Screenshot detection lives in the main app
UI lives in the module
Presentation handled via UIHostingController
Dismiss logic controlled by the app
No private APIs used
🚀 Future Enhancements
Screen recording detection
Auto-dismiss timers
Accessibility improvements
Localization support
Dark/Light theme presets
📄 License
MIT License
Feel free to use, modify, and distribute.
👨‍💻 Author
Created by Baman
Built with ❤️ using SwiftUI & Swift Package Manager