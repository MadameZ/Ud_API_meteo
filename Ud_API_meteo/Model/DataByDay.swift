//
//  DataByDay.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 15/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

class DataByDay {
    // On trie les 48 et crée des objets pour chaque jours
    var name: String
    var array : [WeatherData]
    
    init(name: String) {
        self.name = name
        self.array = []
    }
    
    func updateArray(_ data: WeatherData) {
        
        self.array.append(data)
    }
    
    
}
