//
//  ExtensionTableView.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 12/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if resultWeather != nil {
//            return resultWeather!.data.count
//        }
//        return days[section].array.count
        if section == 0 {
              return 1
        } else {
            return days[section].array.count
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let new = days[indexPath.section].array[indexPath.row]
        
        if indexPath.section == 0, let cell = tableView.dequeueReusableCell(withIdentifier: "collectionCell") as? CollectionCell {
            cell.setup(days[indexPath.section].array)
            
            return cell
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherCell {
            cell.data = new
            return cell
        }


        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.detailTextLabel?.text = new.weather.description
        cell.textLabel?.text = String(new.temp)
//        cell.contentView.backgroundColor = UIColor(red: 45 / 255, green: 146 / 255, blue: 208 / 255, alpha: 1)
   
        return cell
        
     
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section].name
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.section == 0) ? 200 : 100
    }
    
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
      view.tintColor = UIColor(red: 0 / 255, green: 68 / 255, blue: 108 / 255, alpha: 1)
      let header = view as! UITableViewHeaderFooterView
      header.textLabel?.textColor = UIColor.white
  }
    
}
