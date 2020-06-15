//
//  DateHelper.swift
//  Ud_API_meteo
//
//  Created by Caroline Zaini on 12/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class DateHelper {
    
    var formatter = DateFormatter()
    
    func fromTimeStamp(_ int: Int) -> Date {
        return Date(timeIntervalSince1970: Double(int))
    }
    
    // obtenir le jour en tant que String :
    
    func toDay(_ int: Int) -> String {
        let date = fromTimeStamp(int)
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    func toHour(_ int: Int) -> String {
        let date = fromTimeStamp(int)
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}
