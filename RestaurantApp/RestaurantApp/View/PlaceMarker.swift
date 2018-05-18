//
//  PlaceMarker.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceMarker: GMSMarker {
    let place: GooglePlace
    var infoWindow = InfoViewXib()
    init(place: GooglePlace) {
        self.place = place
        super.init()
        infoWindow = loadNiB()
        position = place.coordinate
        icon = #imageLiteral(resourceName: "icon_me")
        title = place.name
        appearAnimation = .pop
    }
    //Funcao que faz o load da xib para este objeto
    func loadNiB() -> InfoViewXib {
        guard let infoWindow = InfoViewXib.instanceFromNib() as? InfoViewXib else {
            return InfoViewXib()
        }
        //Popula a InfoXib para exibir as informações do restaurante
        infoWindow.titleLabel.text = place.name
        infoWindow.subtitleLabel.text = place.address
        infoWindow.coordinates = place.coordinate
        return infoWindow
    }
}
