//
//  Constants.swift
//  WeatherApp
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import Foundation
import CoreLocation

struct Constants {
    static let apiKey = "bb00a89ec789244d9b402d320d0cf5eb"
    static func weatherIcon(_ icon : String) -> URL{
        return URL(string:"https://openweathermap.org/img/wn/\(icon)@2x.png")!
    }
    static func weatherDetailsByCity(_ city: String , apiKey: String) -> URL{
        return URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)")!
    }
    
   static let Visibility = "Visibility"
   static let Pressure = "Pressure"
   static let Humidity = "Humidity"
   static let Wind = "Wind"
   static let Mph = "Mph"
   static let Hz  = "Hz"
   static let ForeignHeat = "°F"
}
