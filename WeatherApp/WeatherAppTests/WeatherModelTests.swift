//
//  WeatherModelTests.swift
//  WeatherAppTests
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import XCTest
@testable import WeatherApp

final class WeatherModelTests: XCTestCase {

    let mockWebService = MockWebService()
    func testPopulateWeatherSuccess() async {
        let expectedWeather = WeatherModel(coord: Coord(lon: 12.0, lat: 20.0), weather: [], base: "", main: Main(temp: 32.0, feels_like: 32.0, temp_Min: 20.0, temp_Max: 90.0, pressure: 90, humidity: 30, sea_level: 10, grnd_level: 40), visibility: 50, wind: Wind(speed: 25.0, deg: 30, gust: 0.0), clouds: Clouds(all: 0), dt: 0, sys: Sys(type: 10, id: 0, country: "", sunrise: 10, sunset: 20), timezone: 0, id: 0, name: "", cod: 0)
        let response = expectedWeather
        mockWebService.response = try? JSONEncoder().encode(response)
        let viewModel = WeatherViewModel(webService: mockWebService)
        await viewModel.populateWeatherDetails("Seatlle")
        XCTAssertNotNil(viewModel.weatherDetails)
        XCTAssertEqual(viewModel.weatherDetails.main.temp, expectedWeather.main.temp)
        XCTAssertEqual(viewModel.weatherDetails.weather.count, expectedWeather.weather.count)
    }
    func testPopulateRecipeDetailsFailure() async {
        mockWebService.error = URLError(.notConnectedToInternet)
        let viewModel = WeatherViewModel(webService: mockWebService)
        await viewModel.populateWeatherDetails("Texas")
        XCTAssertEqual((viewModel.weatherDetails.name),"")
    }
}
