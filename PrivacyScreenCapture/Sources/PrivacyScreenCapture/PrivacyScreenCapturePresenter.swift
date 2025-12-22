//
//  PrivacyScreenCapturePresenter.swift
//  PrivacyScreenCapture
//
//  Created by baman on R 7/12/22.
//

import SwiftUI
#if canImport(UIKit)
import UIKit

@available(iOS 13.0, *)
@MainActor
public final class PrivacyScreenCapturePresenter {

    @MainActor
    private static var hostingController: UIHostingController<PrivacyScreenCaptureView>?

    public static func present(
        on rootViewController: UIViewController,
        config: PrivacyScreenCaptureConfig
    ) {
        let view = PrivacyScreenCaptureView(config: config)
        let controller = UIHostingController(rootView: view)

        controller.modalPresentationStyle = .overFullScreen
        controller.view.backgroundColor = .clear

        hostingController = controller
        rootViewController.present(controller, animated: true, completion: nil)
    }

    public static func dismiss() {
        hostingController?.dismiss(animated: true, completion: nil)
        hostingController = nil
    }
}
#endif
