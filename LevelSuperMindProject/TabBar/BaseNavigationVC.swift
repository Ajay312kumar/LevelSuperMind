//
//  BaseNavigationVC.swift
//  DNB
//
//  Created by Rajpal Singh on 08/12/23.
//

import UIKit

class BaseNavigationVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.layer.cornerRadius = 0.0
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        apperance()
    }
    
    private func apperance() {
        self.navigationBar.backIndicatorImage = UIImage(named: "backArrow")?.withRenderingMode(.alwaysTemplate)
        self.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backArrow")?.withRenderingMode(.alwaysTemplate)
        self.navigationBar.tintColor = UIColor.black
        
        let tabBarApperance = UITabBarAppearance()
        tabBarApperance.configureWithOpaqueBackground()
        tabBarApperance.backgroundColor = UIColor.black
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
        } else {
            // Fallback on earlier versions
        }
        UITabBar.appearance().standardAppearance = tabBarApperance
    }
    
}

