//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    //UIView do tipo GMSMapView
    @IBOutlet weak var googleMapView: GMSMapView!
    
    //Gerente da localização
    let locationManager = CLLocationManager()
    
    //Parâmetros de pesquisa
    let searchRadius:Double=10000
    let dataProvider = GoogleDataProvider()
    
    //Info view que será exibida na Tela
    var markerInfoView: InfoViewXib?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Chama a funcao para setar todos os delegates necessarios
        setupDelegates()
        
        //Faz a requisição de autorização para o sistema utilizar a localização do usuário
        self.locationManager.requestWhenInUseAuthorization()
        
        //Aqui cria-se um observer para a notificação do momento em que o botão de ir for pressionada
        NotificationCenter.default.addObserver(self, selector: #selector(createGpsSheet), name: NSNotification.Name(rawValue: "goButton"), object: nil)
    }
    
    
    /// Função com o único propósito de fazer o setup de delegates.
    func setupDelegates(){
        //Associa essa classe como delegate da CLLocationManager
        self.locationManager.delegate = self
        
        //Associa a classe como delegate de GMSMapViewDelegate
        self.googleMapView.delegate = self
    }
    
    
    /// Função responsavel por buscar os restaurantes e criar os markers na tela
    ///
    /// - Parameter coordinate: Coordenadas da localização atual do Usuário
    func getRestaurantPlaces(coordinate:CLLocationCoordinate2D){
        googleMapView.clear()
        
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius: searchRadius, types: ["restaurantes"]){
            places in
            print(coordinate)
            for place in places {
                let marker = PlaceMarker(place: place)
                OperationQueue.main.addOperation {
                    marker.map = self.googleMapView
                }
            }
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


