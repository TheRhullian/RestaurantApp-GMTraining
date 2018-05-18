//
//  GoogleDataProvider.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import CoreLocation
import SwiftyJSON

typealias PlacesCompletion = ([GooglePlace]) -> Void
typealias PhotoCompletion = (UIImage?) -> Void

class GoogleDataProvider {

    //Esta função faz a requisição para buscar os locais requisitados nos parametros da url
    func fetchPlacesNearCoordinate(_ coordinate: CLLocationCoordinate2D,
                                   radius: Double,
                                   types: [String],
                                   completion: @escaping PlacesCompletion) {
        //Url utilizada para requisição
        var url:[String] = []
        url.append("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(coordinate.latitude),")
        url.append("+\(coordinate.longitude)&radius=500&type=restaurant&key=\(googleApiKey)")
        let requestUrl = url[0]+url[1]
        //Array que será devolvido para popular o map
        var placesArray:[GooglePlace] = []

        //Requisição da url será realizada
        Alamofire.request(requestUrl).responseJSON(completionHandler: { (data) in
            //resultados chegam com um json e faço o tratamento do mesmo até chegar em um dicionário
            //para criar os objetos GooglePlaces
            if let results = data.result.value as? NSDictionary {
                if let elements = results["results"] as? NSArray {
                    for element in elements {
                        if let place = element as? NSDictionary {
                            //Cria o objeto e o adiciona ao array
                            let newPlace = GooglePlace(dictionary: place)
                            placesArray.append(newPlace)
                        }
                    }
                    OperationQueue.main.addOperation {
                        //devolve o array para popular a mapview
                        completion(placesArray)
                    }
                }
            }
        })
    }
}
