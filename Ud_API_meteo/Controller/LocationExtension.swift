//
//  LocationExtension.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 12/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: - Dans info.plist

// 1. Privacy - Location Always and When In Use Usage Description -> Utiliser la position de l'utilisateur (message qu'il va recevoir)
// 2. Privacy - Location Always Usage Description -> Utiliser la position de l'utilisateur
// 3. Privacy - Location Usage Description -> Utiliser la position de l'utilisateur
// 4. Privacy - Location When In Use Usage Description -> Utiliser la position de l'utilisateur


// MARK: - extension

extension ViewController: CLLocationManagerDelegate {
    
    
    func setup() {
        
        manager.delegate = self
        
        /// on va toujours demander l'autorisation à notre user :
        manager.requestAlwaysAuthorization()
        
        /// commencer de mettre à jour notre position :
        manager.startUpdatingLocation()
 
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /// as t-on au moins une position dans notre tableau de locations [CCLocation] :
        guard let location = locations.last else { return }
        
        /// Pour ne pas à updater la location plusieurs fois de suite :
        manager.startUpdatingLocation()
        
        // Notre requête API va s'apeller dès qu'on a notre location :
        /// pour avoir les coordonnées :
        let coords = location.coordinate
        APIRequest().start(coords.latitude, coords.longitude) { (result, error) in
            print(error ?? "")
            self.resultWeather = result
            self.updateUI()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erreur : \(error.localizedDescription)")
    }
    
    
}
