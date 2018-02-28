//
//  InfoViewXib.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit


class InfoViewXib: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    class func instanceFromNib()->UIView{
        let info = UINib(nibName: "InfoView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        
        
        info.layer.cornerRadius = 10
        info.layer.masksToBounds = true
        
        return info
    }
  
    
    @IBAction func openNavigation(_ sender: UIButton) {
        print("Botão Funciona!")
    }
}


