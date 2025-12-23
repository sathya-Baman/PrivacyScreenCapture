//
//  PrivacyScreenCaptureConfig.swift
//  PrivacyScreenCapture
//
//  Created by baman on R 7/12/22.
//

import SwiftUI

@available(iOS 13.0, *)
public struct PrivacyScreenCaptureConfig {
    public let backgroundColor: Color
    public let title: String
    public let description: String
    public let onDismiss: () -> Void

    public init(
        backgroundColor: Color,
        title: String,
        description: String,
        onDismiss: @escaping () -> Void
    ) {
        self.backgroundColor = backgroundColor
        self.title = title
        self.description = description
        self.onDismiss = onDismiss
    }
}
