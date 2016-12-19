//
//  ThemeManager.swift
//  KTheming
//
//  Created by Kesava on 07/06/2016.
//  Copyright © 2016 Small Screen Science Ltd Ltd. All rights reserved.
//

import Foundation
import UIKit

enum ThemeConstants {
    static let defaultThemeName  = "BFTheme"
    
    static let fileTypePlist  = "plist"
    static let plistKeyDefTheme  = "defaultThemeName"
    static let plistKeyType  = "type"
    static let plistKeyFont  = "font"
    static let plistKeyTextSize  = "textSize"
    static let plistKeyFontWeight  = "fontWeight"
    static let plistKeyTextColor  = "textColor"
    static let plistKeyImageName  = "imageName"
    static let plistKeyColorHex  = "hex"
    static let plistKeyBGColorHex  = "bgHex"
    static let plistKeyShadowOffsetX  = "offsetx"
    static let plistKeyShadowOffsetY  = "offsety"
    static let plistKeyShadowRadius  = "radius"
    static let plistKeyShadowOpacity  = "opacity"
    static let plistKeyCornerRadius  = "cornerRadius"
    static let plistKeyTitleLeftInset  = "titleLeftInset"
    static let plistKeyImageTintHex  = "imageTintHex"
    static let plistKeyBorderHex  = "borderHex"
    
    static let plistKeyCategoryImages  = "Images"
    static let plistKeyCategoryLabels  = "Labels"
    
    static let themeLblHeader = "Submenu_Subheader"
    static let themeLblSubHeader = "Cell_PlaceTitle"
    static let themeLblRegularParagraph = "Cell_Default"
    
    static let themeImgViewEmpty = "Empty"
    
    static let themeColorPurple = "color_purple"
    static let themeColorWhite = "color_white"
    static let themeColorYellow = "color_yellow"
    static let themeColorBlack = "color_black"
    static let themeColorRed = "color_red"
}

class ThemeManager {
    static let sharedInstance:ThemeManager = ThemeManager()
    
    var plistDict: [String:[String:AnyObject]]
    
    fileprivate init() {
        let bundle = Bundle(for:type(of: self))
        
        var path = bundle.path(forResource: ThemeConstants.defaultThemeName, ofType: ThemeConstants.fileTypePlist)
        
        if let infoPlist = bundle.infoDictionary {
            if let defaultThemeName:String = infoPlist[ThemeConstants.plistKeyDefTheme] as? String {
                path = bundle.path(forResource: defaultThemeName, ofType: ThemeConstants.fileTypePlist)
            }
        }
        
        if let dict = NSDictionary(contentsOfFile: path!) as? [String : [String:AnyObject]] {
            self.plistDict = dict
        } else {
            self.plistDict = [:]
        }
    }
    
    fileprivate func get(_ type:String) -> AnyObject? {
        let dict = ThemeManager.sharedInstance.plistDict[type]!
        
        if let typeStr = dict[ThemeConstants.plistKeyType] as? String {
            if typeStr == "UILabel" {
                let lbl = Label()
                lbl.type = type
                return lbl
            }
            
            if typeStr == "UIButton" {
                let lbl = Button()
                lbl.type = type
                return lbl
            }
            
            if typeStr == "UITextField" {
                let txtFied = TextField()
                txtFied.type = type
                return txtFied
            }
            
            if typeStr == "UITextView" {
                let txtFied = TextView()
                txtFied.type = type
                return txtFied
            }
        }
        
        if let hex = dict[ThemeConstants.plistKeyColorHex] as? String {
            return UIColor(rgba: hex)
        }
        
        
        return nil
    }
    
    func getLabel(_ type:String) -> UILabel? {
        return self.get(type) as? UILabel
    }
    
    func getColor(_ type:String) -> UIColor? {
        return self.get(type) as? UIColor
    }
    
    func getButton(_ type:String) -> Button? {
        return self.get(type) as? Button
    }
    
    func getTextField(_ type:String) -> TextField? {
        return self.get(type) as? TextField
    }
    
    func getTextView(_ type:String) -> TextView? {
        return self.get(type) as? TextView
    }
}
