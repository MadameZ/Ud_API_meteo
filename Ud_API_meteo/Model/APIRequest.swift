//
//  APIRequest.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 12/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation
import UIKit

class APIRequest {
    
    var completion: ((_ result: JSONResult?, _ error: String?) -> Void)?
    
    // On met les propriétés obligatoires par défaut de l'API :
    
    var baseURL = "https://api.weatherbit.io/v2.0/forecast/hourly"
    var apiKey = "1885550925154b0eab2e7ab8bcf43eeb"
    
    /// le language sera par rapport à notre iPhone et si on en a pas on mettra en anglais et en rajoutant "en" lang ne sera plus optionnel :
    var lang = Locale.current.languageCode ?? "en"
    
    var units = "m"
    
    
    // Pour démarrer notre requête :
    func start(_ lat: Double, _ lon: Double, completion: ((_ result: JSONResult?, _ error: String?) -> Void)?) {
        
        /// on génère notre completion donc elle existe :
        self.completion = completion
        
        let urlString =  "\(baseURL)?lat=\(lat)&lon=\(lon)&units=\(units)&lang=\(lang)&key=\(apiKey)"
        print(urlString)
        
        guard let url = URL(string: urlString) else { completion?(nil, "Mausvaise url"); return }
        URLSession.shared.dataTask(with: url, completionHandler: response).resume()
    }
    
    
    
    func response(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        DispatchQueue.main.async {
            if let d = data {
                do {
                    let result = try JSONDecoder().decode(JSONResult.self, from: d)
                    self.completion?(result, nil)
                } catch {
                    self.completion?(nil, error.localizedDescription)
                    
                }
               
            } else {
                self.completion?(nil, error?.localizedDescription ?? "")
            }
        }
        
        
    }
}
