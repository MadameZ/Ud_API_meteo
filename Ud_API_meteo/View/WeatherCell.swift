//
//  WeatherCell.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 15/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var iconIV: UIImageView!
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var data: WeatherData! {
        didSet {
            iconIV.loadIcon(data.weather.icon)
            hourLbl.text = DateHelper().toHour(data.ts)
            tempLbl.text = "\(data.temp) °C"
            descLbl.text = data.weather.description
        }
    }
    
 
}
