//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by Rhullian Damião on 27/02/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

//API Gerada com restrict Key
let googleApiKey = "AIzaSyDfwfi9GsTQw_QvL42w_Ce7O19FH7j5RJ4"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //Utilizo essa função para fazer a requisição da API do SDK e do Places
        //A Key usada nesse código foi criada hoje, com restrict key
        //que necessita do bundle identifier desse projeto para funcionar.
        //Fiz isso para mostrar todo o processo feito realmente.
        GMSServices.provideAPIKey(googleApiKey)
        GMSPlacesClient.provideAPIKey(googleApiKey)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}
