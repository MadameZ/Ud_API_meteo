//
//  ViewController.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 12/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var tempIconIV: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    /// Pour stocker la localisation. Utiliser dans le fichier LocationExtension :
    var manager = CLLocationManager()
    
    var resultWeather: JSONResult?
    
    var days: [DataByDay] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        backView.circle(backView.frame.width / 2)
        
        tableView.delegate = self
        tableView.dataSource = self
  

    }
    
    func updateUI() {
        
        days = []
        
        tableView.reloadData()
        
        guard let new = resultWeather else { return }
        
        cityNameLbl.text = new.city_name
        
        /// on veut la première prévision étant donné qu'on en a 48 :
        guard let first = new.data.first else { return }
        tempLbl.text = "\(first.temp) °C"
        
        tempIconIV.loadIcon(first.weather.icon)
        
        descLbl.text = first.weather.description
        
        
        new.data.forEach { (weatherData) in
            /// ts -> time stamp
            let day =  DateHelper().toDay(weatherData.ts)
            
            print(DateHelper().toDay(weatherData.ts))
            
            /// On en récupère un :
            if let existing = days.filter({$0.name == day}).first {
                existing.updateArray(weatherData)
            } else {
                let new = DataByDay(name: day)
                new.updateArray(weatherData)
                days.append(new)
            }
        }
        tableView.reloadData()
    }


}

