//
//  InfoViewXib.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit
import CoreLocation

class InfoViewXib: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var coordinates:CLLocationCoordinate2D?
    
    class func instanceFromNib()->UIView{
        let info = UINib(nibName: "InfoView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        
        info.layer.cornerRadius = 10
        info.layer.masksToBounds = true
        
        return info
    }
  
    
    @IBAction func openNavigation(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "goButton"), object: nil)
    }
    
    
}


