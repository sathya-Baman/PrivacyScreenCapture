//
//  Untitled.swift
//  PrivacyScreenCaptureDemo
//
//  Created by baman on R 7/12/22.
//
import UIKit

extension UIApplication {
    /// Returns the top-most view controller from the key window's rootViewController.
    /// Works on iOS 13+ using connected scenes.
    func topViewController(base: UIViewController? = UIApplication.shared.connectedScenes
                                .compactMap { $0 as? UIWindowScene }
                                .flatMap { $0.windows }
                                .first { $0.isKeyWindow }?.rootViewController) -> UIViewController? {
        guard let base = base else { return nil }

        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }

        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }

        if let presented = base.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }
}
