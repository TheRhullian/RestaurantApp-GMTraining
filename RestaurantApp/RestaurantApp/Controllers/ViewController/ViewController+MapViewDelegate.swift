//
//  ViewController+MapViewDelegate.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import Foundation
import GoogleMaps

extension ViewController:GMSMapViewDelegate{
    
    
    /// Função que remove a InfoView de exibição da Tela
    func removeAllInfoFromScreen(){
        if self.markerInfoView != nil {
            UIView.animate(withDuration: 0.3) {
                self.markerInfoView?.removeFromSuperview()
                self.markerInfoView = nil
            }
        }
    }
    
    
    /// Funcao que prepara a info view para ser exibida na te;a
    func setupInfoView(){
        if self.markerInfoView != nil {
            self.markerInfoView?.translatesAutoresizingMaskIntoConstraints = false
            
            self.markerInfoView?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1, constant: -30).isActive = true
            self.markerInfoView?.heightAnchor.constraint(equalToConstant: 50)
            self.markerInfoView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
            self.markerInfoView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
            
        }
    }
    
    
    /// Funcao que muda a localização da camera no mapa
    ///
    /// - Parameters:
    ///   - coordinate: Coordenadas que a camera passara a exibir
    ///   - zoom: quantidade de zoom que deve ser dado
    /// - Returns: retorna se tudo ocorreu de forma correta(true), se não (false)
    func changeCameraPosition(Coordinates coordinate:CLLocationCoordinate2D, Zoom zoom:Float)->Bool{
        
        //Registra a nova posicao para a camera do map view
        let newPosition = GMSCameraPosition.camera(withTarget: coordinate, zoom: zoom, bearing: 0, viewingAngle: 0)
        //Executa a animação para exibir na tela
        self.googleMapView.animate(to: newPosition)
        
        return true
    }
    
    
    ///Funcao que é chamada quando o usuário seleciona um marker
    ///
    /// - Parameters:
    ///   - mapView: View que está carregada o mapa
    ///   - marker: Pin que foi selecionada
    /// - Returns: Se tudo ocorreu de forma correta (true), se não(false)
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        //Remove qualquer um que está na tela atualmente
        removeAllInfoFromScreen()
        
        //Busca as informaçoes para a proxima
        let mark = marker as! PlaceMarker
        self.markerInfoView = mark.infoWindow
        
        //Faz a mudança na camera
        if changeCameraPosition(Coordinates: marker.position, Zoom: 18){
            //Adiciona sa superview
            self.view.addSubview(markerInfoView!)
            //Faz a setagem de layout
            setupInfoView()
        }
        
        return true
    }
    
    /// Funcao que é chamada todas as vezes que o usuário apertar o botão para mostrar a localização atual
    ///
    /// - Parameter mapView: View que está carregada o mapa
    /// - Returns: Se tudo ocorreu de forma correta (true), se não(false)
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        //Garante que é possivel pegar a localização do usuário
        guard let userLocation = self.googleMapView.myLocation else {
            return false
        }
        removeAllInfoFromScreen()
        
        return changeCameraPosition(Coordinates: userLocation.coordinate, Zoom: 16)
    }
}
