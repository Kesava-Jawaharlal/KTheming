//
//  KThemeLbl.swift
//
//  Created by Kesava on 07/06/2016.
//  Copyright © 2016 Small Screen Science Ltd. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class KThemeLbl: UILabel {
    
    @IBInspectable var type: String = KThemeConstants.themeLblHeaderOne {
        didSet {
            let dict = KTheme.plistDict[type]!
            self.font = UIFont(name: dict[KThemeConstants.plistKeyFont] as! String, size:dict[KThemeConstants.plistKeyTextSize] as! CGFloat)
            self.textColor = UIColor(hexValue: dict[KThemeConstants.plistKeyTextColor] as! String, withAlphaValue: 1.0)
        }
    }
}