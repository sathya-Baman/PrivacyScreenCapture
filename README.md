# 📸 PrivacyScreenCapture

**PrivacyScreenCapture** is a lightweight Swift Package that helps you **detect screenshots and display a customizable privacy warning overlay** in iOS apps.

It is designed to be:

- ✅ Modular
- ✅ SwiftUI-friendly
- ✅ UIKit compatible
- ✅ iOS 13+ supported
- ✅ Easy to integrate via Swift Package Manager

---

## ✨ Features

- Detect screenshots in your main app
- Display a full-screen privacy warning popup
- Fully customizable UI (colors, title, description)
- SwiftUI-based UI presented via UIKit
- Callback to notify the main app when the popup is dismissed
- Supports images and asset catalogs via `Bundle.module`

---

## 📱 Use Case

This module is useful when your app handles **sensitive content**, such as:

- Banking or finance apps
- Healthcare apps
- Enterprise or internal apps
- DRM-protected or confidential data

When a screenshot is taken, you can:

1. Detect it in the main app
2. Show a privacy warning popup
3. React when the user dismisses the popup

---

## 📦 Installation

### Swift Package Manager

#### Local Package

1. Open Xcode
2. Go to **File → Add Packages…**
3. Select **Add Local…**
4. Choose the `PrivacyScreenCapture` folder

#### Remote Package

```swift
.package(
    url: "https://github.com/your-org/PrivacyScreenCapture.git",
    from: "1.0.0"
)

## 🛠️ Integration Guide

#### 1️⃣ Import the Module

```swift
import PrivacyScreenCapture

#### 2️⃣ Detect Screenshot in Main App
Screenshot detection must be implemented in the main application:

```swift
NotificationCenter.default.addObserver(
    forName: UIApplication.userDidTakeScreenshotNotification,
    object: nil,
    queue: .main
) { _ in
    showScreenshotPopup()
}

#### 3️⃣ Present the Privacy Popup

```swift
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
            PrivacyScreenCapturePresenter.dismiss()
            print("❌ Screenshot popup closed by user")
        }
    )

    PrivacyScreenCapturePresenter.present(
        on: rootVC,
        config: config
    )
}
```

## 🧩 Configuration API
PrivacyScreenCaptureConfig

```swift
public struct PrivacyScreenCaptureConfig {
    public let backgroundColor: Color
    public let title: String
    public let description: String
    public let onDismiss: () -> Void
}
```

## ✅ iOS Compatibility
#### Platform	Supported
#### iOS 13+	✅
#### SwiftUI	✅
#### UIKit	✅

## Demo
<img width="300" height="600" alt="Simulator Screenshot - iPhone 17 Pro - 2025-12-23 at 11 38 41" src="https://github.com/user-attachments/assets/fb6728b3-4605-4a2a-8f70-6497a40ae13b" />


## 📄 License
MIT License


## 👨‍💻 Author
Created by Baman
Built with ❤️ using SwiftUI & Swift Package Manager



