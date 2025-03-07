//
//  CustomTabBarController.swift
//  LevelSuperMindProject
//
//  Created by Ajay Kumar on 07/03/25.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black // Keep your tab bar color
            appearance.shadowColor = UIColor.white // White separator line

            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
    }

    private func addTopBorderToTabBar() {
        let topBorder = UIView()
        topBorder.backgroundColor = UIColor.white // White color
        topBorder.translatesAutoresizingMaskIntoConstraints = false
        
        tabBar.addSubview(topBorder)
        
        NSLayoutConstraint.activate([
            topBorder.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            topBorder.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            topBorder.topAnchor.constraint(equalTo: tabBar.topAnchor),
            topBorder.heightAnchor.constraint(equalToConstant: 1) // Thin white line
        ])
    }
}
