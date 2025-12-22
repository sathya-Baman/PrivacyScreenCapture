//
//  ContentView.swift
//  PrivacyScreenCaptureDemo
//
//  Created by baman on R 7/12/22.
//

import SwiftUI
import PrivacyScreenCapture

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "hand.raised.circle.fill")
                .frame(width: 200, height: 200)
                .imageScale(.large)
                .font(.system(size: 100))
                .foregroundStyle(.tint)
                .tint(Color.red)
            
            Text("This module helps to show a privacy screen when a screenshot is taken.")
                .padding()
            
            Button(action: {
                showScreenshotPopup()
            }) {
                // The label view: what the button looks like
                Text("Show Screenshot Popup")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
    }
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
                // ✅ Callback from module
                PrivacyScreenCapturePresenter.dismiss()
                print("❌ Screenshot popup closed by user")
            }
        )

        PrivacyScreenCapturePresenter.present(
            on: rootVC,
            config: config
        )
    }
}



#Preview {
    ContentView()
}
