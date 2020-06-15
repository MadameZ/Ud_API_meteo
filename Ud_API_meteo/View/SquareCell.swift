//
//  SquareCell.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 15/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class SquareCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var iconIv: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var data: WeatherData!
    
    func setupCell(_ data: WeatherData) {
        self.data = data
        timeLbl.text = DateHelper().toHour(self.data.ts)
        iconIv.loadIcon(self.data.weather.icon)
        tempLbl.text = "\(self.data.temp) °C"
        descLbl.text = self.data.weather.description
    }
    
}
