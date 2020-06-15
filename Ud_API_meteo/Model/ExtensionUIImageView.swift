//
//  ExtensionUIImageView.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 12/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadIcon(_ icon: String) {
        
        // Cette url a été récupérer depuis la doc weatherBit -> weather icon code -> ouvrir dans un nouvel onglet -> copie l'adresse url du nouvel onglet
        let urlString = "https://www.weatherbit.io/static/img/icons/\(icon).png"
        guard let url = URL(string: urlString) else { return }
        /// pour les _ : comme on en n'a pas besoin
        URLSession.shared.dataTask(with: url) { (d, _, _) in
            DispatchQueue.main.async {
                 guard d != nil else { return }
                           let image = UIImage(data: d!)
                           self.image = image
            }
        }.resume()
           
    }
    
}

extension UIView {
    
    func circle(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.borderWidth = 4
        layer.borderColor = UIColor(red: 0 / 255, green: 85 / 255, blue: 136 / 255, alpha:1).cgColor
    }
    
}
