//
//  GooglePlace.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import Foundation
import UIKit
import Foundation
import CoreLocation
import SwiftyJSON

class GooglePlace {
    var name: String
    var address: String
    var coordinate: CLLocationCoordinate2D
    var photoReference: String?
    var photo: UIImage?

    init(dictionary:NSDictionary){
        let json = JSON(dictionary)
        print(json)
        name = json["name"].stringValue
        address = json["vicinity"].stringValue
        let lat = json["geometry"]["location"]["lat"].doubleValue as CLLocationDegrees
        let lng = json["geometry"]["location"]["lng"].doubleValue as CLLocationDegrees
        
        let coord = CLLocationCoordinate2DMake(lat, lng)
        self.coordinate = coord
        
        
    }
    
}
