//
//  FavoriteViewController.swift
//  MyQuotes
//
//  Created by Sierra on 5/3/18.
//  Copyright © 2018 Nagiz. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var FavTitle: UILabel!
    @IBOutlet weak var favoriteimgview: UIImageView!
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let themevalue = defaults.integer(forKey: "theme")
        if themevalue == 0 {
            view.backgroundColor = UIColor.black
            FavTitle.textColor = UIColor.white
        }else{
            view.backgroundColor = UIColor.white
            FavTitle.textColor = .black
        }
        favoriteimgview.layer.cornerRadius = 150.0
        view.backgroundColor = theme
        let image = defaults.integer(forKey: "favOne")
        let imageName = String(image)
        let favimg = UIImage(named:imageName)
        
        favoriteimgview.image = favimg
        if imageborder {
            favoriteimgview.layer.borderColor = UIColor.green.cgColor
            favoriteimgview.layer.borderWidth = 5.0
        }else{
            favoriteimgview.layer.borderWidth = 0
        }
    }

}
