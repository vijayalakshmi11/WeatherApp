//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let webService: WebServiceProtocol
    init(webService: WebServiceProtocol = Webservice()) {
        self.webService = webService
    }
    @Published var weatherDetails: WeatherModel = WeatherModel(coord: Coord(lon: 0.0, lat: 0.0), weather: [], base: "", main: Main(temp: 0.0, feels_like: 0.0, temp_Min: 0.0, temp_Max: 0.0, pressure: 0, humidity: 0, sea_level: 0, grnd_level: 0), visibility: 0, wind: Wind(speed: 0.0, deg: 0, gust: 0.0), clouds: Clouds(all: 0), dt: 0, sys: Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0), timezone: 0, id: 0, name: "", cod: 0)
    func populateWeatherDetails(_ city: String) async  {
        do {
        
                weatherDetails = try await webService.get(url: Constants.weatherDetailsByCity(city, apiKey: Constants.apiKey)) { data in
                return try? JSONDecoder().decode(WeatherModel.self, from: data)
            }
        } catch {
            print(error)
        }
    }
}
