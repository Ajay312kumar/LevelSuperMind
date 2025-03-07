//
//  AppFonts.swift
//  DNB
//
//  Created by Rajpal Singh on 12/12/23.
//

import Foundation
import UIKit

enum AppFonts : String {
    case Barlow_Black = "Barlow-Black"
    case Barlow_Bold = "Barlow-Bold"
    case Barlow_ExtraLight = "Barlow-ExtraLight"
    case Barlow_Light = "Barlow-Light"
    case Barlow_Medium = "Barlow-Medium"
    case Barlow_Regular = "Barlow-Regular"
    case Barlow_SemiBold = "Barlow-SemiBold"
    case Barlow_Thin = "Barlow-Thin"
    case Barlow_ExtraBold = "Barlow_ExtraBold"
}

extension AppFonts {
    
    func withSize(_ fontSize: CGFloat) -> UIFont {
        
        return UIFont(name: self.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    func withDefaultSize() -> UIFont {
        
        return UIFont(name: self.rawValue, size: 12.0) ?? UIFont.systemFont(ofSize: 12.0)
    }
}
