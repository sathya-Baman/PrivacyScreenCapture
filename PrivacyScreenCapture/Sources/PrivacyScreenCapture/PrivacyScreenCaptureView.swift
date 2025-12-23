//
//  PrivacyScreenCaptureView.swift
//  PrivacyScreenCapture
//
//  Created by baman on R 7/12/22.
//

import SwiftUI

@available(iOS 13.0, *)
public struct PrivacyScreenCaptureView: View {

    let config: PrivacyScreenCaptureConfig

    public init(config: PrivacyScreenCaptureConfig) {
        self.config = config
        print("Bundle path:", Bundle.module.bundlePath)
    }

    public var body: some View {
        ZStack {
            config.backgroundColor
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Image("warning_red", bundle: .module)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)

                Text(config.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Text(config.description)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Button(action: {
                    config.onDismiss()
                }) {
                    Text("Close")
                        .font(.body)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            }
            .padding()
            .frame(maxWidth: 300)
            .background(Color.black.opacity(0.7))
            .cornerRadius(16)
        }
    }
}
