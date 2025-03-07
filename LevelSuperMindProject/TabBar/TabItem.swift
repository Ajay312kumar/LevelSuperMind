//
//  TabItem.swift
//  DNB
//
//  Created by Rajpal Singh on 08/12/23.
//

import Foundation
import UIKit

enum TabItems: String, CaseIterable {
    
    case Home = "Home"
    case Explore = "Explore"
    case Setting = "Setting"
    
    
    var viewController: UIViewController {
        switch self {
        case .Home:
            return HomeVC.instantiate(fromAppStoryboard: .Main)
        case .Explore:
            return ExploreVC.instantiate(fromAppStoryboard: .Main)
        case .Setting:
            return SettingVC.instantiate(fromAppStoryboard: .Main)
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .Home:
            return UIImage(named: "home_dark")?.withTintColor(AppColor.app_white)
        case .Explore:
            return UIImage(named: "chat_dark")?.withTintColor(AppColor.app_white)
        case .Setting:
            return UIImage(named: "event_dark")?.withTintColor(AppColor.app_white)
        }
    }
    
    var unSelectedIcon: UIImage? {
        switch self {
        case .Home:
            return UIImage(named: "Home_light")?.withTintColor(AppColor.app_gray)
        case .Explore:
            return UIImage(named: "chat_light")?.withTintColor(AppColor.app_gray)
        case .Setting:
            return UIImage(named: "event_light")?.withTintColor(AppColor.app_gray)
            
        }
        
        var displayTitle: String {
            return self.rawValue.capitalized(with: nil)
        }
    }
}

