//
//  TabBarVC.swift
//  DNB
//
//  Created by Rajpal Singh on 08/12/23.
//

import UIKit
import Foundation


class TabBarVC: UITabBarController {
    
    var upperLineView: UIView!
    let spacing: CGFloat = 40
   
    // MARK: - Variables
    let tabItems: [TabItems] = [.Home, .Explore, .Setting]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        initialViewLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("ViewAllSelected"), object: nil, queue: .main) { [weak self] _ in
            self?.selectedIndex = 2
            self?.addTabbarIndicatorView(index: 2)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    fileprivate func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
          return
        }
        if !isFirstTime {
          upperLineView.removeFromSuperview()
        }
        upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY + 0.1, width: tabView.frame.size.width - spacing * 2, height: 4))
        upperLineView.backgroundColor = UIColor.clear
        tabBar.addSubview(upperLineView)
     }
}


extension TabBarVC {

    private func initialViewLoad() {
        self.navigationController?.isNavigationBarHidden = false
        self.setUPTabBar()
        self.selectedIndex = 0 // default our selected index to the first item
    }

    private func setUPTabBar(){
        self.delegate = self
        
        let tabBarAppearance = UITabBar.appearance()
        //tabBarAppearance.barTintColor = AppColor.app_white // Change the background color
        tabBarAppearance.tintColor = UIColor.white
        //tabBarAppearance.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        let HomeVC = tabItems[0].viewController
        HomeVC.tabBarItem = UITabBarItem(title: "Home", image: tabItems[0].unSelectedIcon?.withRenderingMode(.alwaysOriginal), selectedImage: tabItems[0].selectedIcon?.withRenderingMode(.alwaysOriginal))
        let nav1 = BaseNavigationVC(rootViewController: HomeVC )

        let chatVC = tabItems[1].viewController
        chatVC.tabBarItem = UITabBarItem(title: "Explore", image: tabItems[1].unSelectedIcon?.withRenderingMode(.alwaysOriginal), selectedImage: tabItems[1].selectedIcon?.withRenderingMode(.alwaysOriginal))
        let nav2 = BaseNavigationVC(rootViewController: chatVC)

        let eventVC = tabItems[2].viewController
        eventVC.tabBarItem = UITabBarItem(title: "You", image: tabItems[2].unSelectedIcon?.withRenderingMode(.alwaysOriginal), selectedImage: tabItems[2].selectedIcon?.withRenderingMode(.alwaysOriginal))
        let nav3 = BaseNavigationVC(rootViewController: eventVC)
       
        viewControllers = [nav1, nav2, nav3]
    }
}

extension TabBarVC: UITabBarControllerDelegate {
    func setTabBarVisible(visible:Bool, duration: TimeInterval, animated:Bool) {

        // animation
        UIViewPropertyAnimator(duration: duration, curve: .linear) {
            self.tabBar.isHidden = !visible
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}
