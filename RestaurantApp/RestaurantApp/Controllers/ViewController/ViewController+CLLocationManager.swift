//
//  ViewController+CLLocationManager.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import Foundation
import GoogleMaps

extension ViewController:CLLocationManagerDelegate {
    
    
    /// Essa função é chamada sempre que houver uma alteração na autorização de uso da localização
    ///
    /// - Parameters:
    ///   - manager: Objeto manager responsavel pelo controle da user location e autorizações
    ///   - status: Qual o status atual da Autorização para acessar a localização do Usuário
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        
        googleMapView.isMyLocationEnabled = true
        googleMapView.settings.myLocationButton = true
    }
    
    
    /// Essa função é chamada sempre que o location manager receber atualizações de coordenadas
    ///
    /// - Parameters:
    ///   - manager: Objeto manager responsavel pelo controle da user location e autorizações
    ///   - locations: Localização que será exibida tela
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        if changeCameraPosition(Coordinates: location.coordinate, Zoom: 16) {
            getRestaurantPlaces(coordinate: location.coordinate)
            locationManager.stopUpdatingLocation()
        }
        
    }
}
