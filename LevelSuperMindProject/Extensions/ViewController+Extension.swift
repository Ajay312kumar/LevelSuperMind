//
//  ViewController+Extension.swift
//  DNB
//
//  Created by Rajpal Singh on 05/12/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    ///Not using static as it won't be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        return "\(self)"
    }
    
    func getTabBarHeight() -> CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window  = windowScene.windows.first {
                return 65 + window.safeAreaInsets.bottom
            }
        }
        return 65
    }
    

    
//    func moveToRoot() {
//        let data = AppUserDefaults.getSignUpToken()
//        if data.isEmpty {
//         //   clearDataFromUserDefaults()
//            moveToLogin()
//        } else {
//            moveToTabBar()
//        }
//    }
    
//    func moveToTabBar() {
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
//        let tabBarVC = TabBarVC.instantiate(fromAppStoryboard: .Home)
//        let navVC = UINavigationController(rootViewController: tabBarVC)
//        sceneDelegate.window?.rootViewController =  navVC
////        kSharedAppDelegate?.moveToCommingSoonVC()
//    }
//    
//    func moveToLogin() {
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
//        let login = LoginVC.instantiate(fromAppStoryboard: .Main)
//        let navVC = UINavigationController(rootViewController: login)
//        sceneDelegate.window?.rootViewController =  navVC
//    }
//    
//    func clearDataFromUserDefaults() {
//        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
//            return
//        }
//        UserDefaults.standard.removePersistentDomain(forName: bundleIdentifier)
//        UserDefaults.standard.synchronize()
//    }
    
}

//extension UIViewController {
//    static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let navigationController = controller as? UINavigationController {
//            return topViewController(controller: navigationController.visibleViewController)
//        }
//        if let tabController = controller as? UITabBarController {
//            if let selected = tabController.selectedViewController {
//                return topViewController(controller: selected)
//            }
//        }
//        if let presented = controller?.presentedViewController {
//            return topViewController(controller: presented)
//        }
//        return controller
//    }
//}
