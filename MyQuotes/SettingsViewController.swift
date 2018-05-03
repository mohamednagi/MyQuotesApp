//
//  SettingsViewController.swift
//  MyQuotes
//
//  Created by Sierra on 5/3/18.
//  Copyright © 2018 Nagiz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var Settingslbls: [UILabel]!
    @IBOutlet weak var SegmentedTheme: UISegmentedControl!
    @IBOutlet weak var StepperFavourite: UIStepper!
    @IBOutlet weak var SwitchBorder: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = theme
        let themevalue = defaults.integer(forKey: "theme")
        if themevalue == 0 {
            view.backgroundColor = UIColor.black
            changethemecolor(color: .white)
        }else{
            view.backgroundColor = UIColor.white
            changethemecolor(color: .black)
        }
    }

    @IBAction func ThemeChanged(_ sender: Any) {
        let index = SegmentedTheme.selectedSegmentIndex
        defaults.set(index, forKey: "theme")
        if index == 0 {
            theme = UIColor.black
            changethemecolor(color: .white)
        }else{
            theme = UIColor.white
           changethemecolor(color: .black)
        }
        view.backgroundColor = theme
    }
    
    @IBAction func BorderSwitched(_ sender: Any) {
        if SwitchBorder.isOn{
            imageborder = true
        }else{
            imageborder=false
        }
    }
    
    func changethemecolor(color:UIColor){
        for label in Settingslbls {
            label.textColor = color
        }
        SegmentedTheme.tintColor = color
        StepperFavourite.tintColor = color
        SwitchBorder.onTintColor = color
    }
    
}
