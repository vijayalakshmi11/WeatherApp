//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import Foundation

// MARK: - Welcome
struct WeatherModel: Identifiable, Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon: Double?
    let lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_Min: Double?
    let temp_Max: Double?
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

// MARK: - Sys
struct Sys: Codable {
    let type: Int?
    let id: Int?
    let country: String?
    let sunrise: Int
    let sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}
