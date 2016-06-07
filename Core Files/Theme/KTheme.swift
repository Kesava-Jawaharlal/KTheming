//
//  KTheme.swift
//  KThemeSample
//
//  Created by Kesava on 07/06/2016.
//  Copyright © 2016 Small Screen Science Ltd. All rights reserved.
//

import Foundation

enum KThemeConstants {
    static let defaultThemeName  = "KThemeOne"
    static let fileTypePlist  = "plist"
    static let plistKeyDefTheme  = "defaultThemeName"
    static let plistKeyType  = "type"
    static let plistKeyFont  = "font"
    static let plistKeyTextSize  = "textSize"
    static let plistKeyTextColor  = "textColor"
    
    static let themeLblHeaderOne = "HeaderOne"
    static let themeLblHeaderTwo = "HeaderTwo"
    static let themeLblNormal = "NormalLabel"
    static let themeLblSmall = "SmallLabel"
    
    static let smallOffset = "8"
    static let normalOffset = "12"
    static let largeOffset = "24"
    
    static let normalLblHeight = "21"

    
}

class KTheme {
    
    class var plistDict: [String:[String:AnyObject]] {
        struct Static {
            static var instance: [String:[String:AnyObject]]?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            let myBundle = NSBundle(forClass: self)
            
            var path = myBundle.pathForResource(KThemeConstants.defaultThemeName, ofType: KThemeConstants.fileTypePlist)
            
            if let infoPlist = NSBundle.mainBundle().infoDictionary {
                if let defaultThemeName:String = infoPlist[KThemeConstants.plistKeyDefTheme] as? String {
                    path = myBundle.pathForResource(defaultThemeName, ofType: KThemeConstants.fileTypePlist)
                }
            }
            
            let dict = NSDictionary(contentsOfFile: path!)
            Static.instance = dict  as? [String : [String:AnyObject]]
        }
        
        return Static.instance!
    }
    
    class func get(type:String) -> AnyObject? {
        let dict = KTheme.plistDict[type]!
        
        switch dict[KThemeConstants.plistKeyType] as! String {
            case "UILabel":
                let lbl = KThemeLbl()
                lbl.type = type
                return lbl
            default:
                break
        }
        
        return nil
    }
}