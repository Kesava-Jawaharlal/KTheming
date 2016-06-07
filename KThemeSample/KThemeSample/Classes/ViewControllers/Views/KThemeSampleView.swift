//
//  KThemeSampleView.swift
//  KThemeSample
//
//  Created by Kesava on 07/06/2016.
//  Copyright © 2016 Small Screen Science Ltd. All rights reserved.
//

import Foundation

class KThemeSampleView : UIView {
    //MARK -Inits
    override func awakeFromNib() {
        self.configure()
    }
    
    //MARK - vars
    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var themeLbl: UILabel!
    
    lazy var headerLbl:UILabel = {
        let lbl = KTheme.get(KThemeConstants.themeLblHeaderOne) as! UILabel
        lbl.text = "Header One from Code"
       return lbl
    }()
    
    lazy var headerTwoLbl:UILabel = {
        let lbl = KTheme.get(KThemeConstants.themeLblHeaderTwo) as! UILabel
        lbl.text = "Header Two from Code"
        return lbl
    }()
    
    lazy var normalLbl:UILabel = {
        let lbl = KTheme.get(KThemeConstants.themeLblNormal) as! UILabel
        lbl.text = "Normal Label from Code"
        return lbl
    }()
    
    lazy var smallLbl:UILabel = {
        let lbl = KTheme.get(KThemeConstants.themeLblSmall) as! UILabel
        lbl.text = "Small Label from Code"
        return lbl
    }()
    
    //MARK - Setup
    func configure() {
        if let infoPlist = NSBundle.mainBundle().infoDictionary {
            if let defaultThemeName:String = infoPlist[KThemeConstants.plistKeyDefTheme] as? String {
                self.themeLbl.text = defaultThemeName
            }
        }
        
        self.setupSubViews()
        self.setupAutoLayout()
    }
    
    func setupSubViews() {
        self.addSubview(self.headerLbl)
        self.addSubview(self.headerTwoLbl)
        self.addSubview(self.normalLbl)
        self.addSubview(self.smallLbl)
    }
    
    func setupAutoLayout() {
        self.headerLbl.alignLeading(KThemeConstants.normalOffset, trailing: String("-"+KThemeConstants.normalOffset), toView: self)
        self.headerLbl.alignAttribute(.Top, toAttribute: .Bottom, ofView: self.mainLbl, predicate: KThemeConstants.normalOffset)
        self.headerLbl.constrainHeight(KThemeConstants.normalLblHeight)
        
        self.headerTwoLbl.alignLeading(KThemeConstants.normalOffset, trailing: String("-"+KThemeConstants.normalOffset), toView: self)
        self.headerTwoLbl.alignAttribute(.Top, toAttribute: .Bottom, ofView: self.headerLbl, predicate: KThemeConstants.normalOffset)
        self.headerTwoLbl.constrainHeight(KThemeConstants.normalLblHeight)

        self.normalLbl.alignLeading(KThemeConstants.normalOffset, trailing: String("-"+KThemeConstants.normalOffset), toView: self)
        self.normalLbl.alignAttribute(.Top, toAttribute: .Bottom, ofView: self.headerTwoLbl, predicate: KThemeConstants.normalOffset)
        self.normalLbl.constrainHeight(KThemeConstants.normalLblHeight)

        self.smallLbl.alignLeading(KThemeConstants.normalOffset, trailing: String("-"+KThemeConstants.normalOffset), toView: self)
        self.smallLbl.alignAttribute(.Top, toAttribute: .Bottom, ofView: self.normalLbl, predicate: KThemeConstants.normalOffset)
        self.smallLbl.constrainHeight(KThemeConstants.normalLblHeight)

    }
}