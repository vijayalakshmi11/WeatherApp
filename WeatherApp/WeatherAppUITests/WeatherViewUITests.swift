//
//  WeatherViewUITests.swift
//  WeatherAppTUITests
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import XCTest

final class WeatherViewUITests: XCTestCase {
    override func setUp() {
            super.setUp()
            // Continue after failure
            continueAfterFailure = false
            // Launch the app
            XCUIApplication().launch()
        }

        func testWeatherViewElements() {
            let app = XCUIApplication()
            
            // Assert that the search button is present
            let searchButton = app.buttons["search"]
            XCTAssertTrue(searchButton.exists, "Search button should exist")

            // Tap the search button to present the sheet
            searchButton.tap()
            
            // Wait for the search sheet to appear
            let searchSheet = app.otherElements["SearchView"]
            XCTAssertTrue(searchSheet.waitForExistence(timeout: 5), "Search sheet should appear")

            // Enter text in the search field
            let searchTextField = app.textFields.element
            searchTextField.tap()
            searchTextField.typeText("San Francisco")
            
            // Verify that the text field contains the text
            XCTAssertEqual(searchTextField.value as? String, "San Francisco")
            
            // Simulate tapping a search result (assuming the SearchView presents results)
            let firstSearchResult = app.tables.cells.element(boundBy: 0)
            XCTAssertTrue(firstSearchResult.exists, "Search result should exist")
            firstSearchResult.tap()
            
            // Assert that the search button is not present anymore (if the sheet is dismissed)
            XCTAssertFalse(searchButton.exists, "Search button should not be present after dismissal")

            // Verify the main view's elements
            let locationLabel = app.staticTexts["location"]
            XCTAssertTrue(locationLabel.exists, "Location label should exist")

            let temperatureLabel = app.staticTexts["temparature"]
            XCTAssertTrue(temperatureLabel.exists, "Temperature label should exist")

            let weatherDescriptionLabel = app.staticTexts["weather feels like"]
            XCTAssertTrue(weatherDescriptionLabel.exists, "Weather description label should exist")

            // Check if the weather icon is present
            let weatherIcon = app.images["weathersymbol"]
            XCTAssertTrue(weatherIcon.exists, "Weather icon should exist")
            
            // Check if additional weather info is present
            let windIcon = app.images["wind icon"]
            XCTAssertTrue(windIcon.exists, "Wind icon should exist")
            
            let humidityIcon = app.images["humidity icom"]
            XCTAssertTrue(humidityIcon.exists, "Humidity icon should exist")
            
            let pressureIcon = app.images["pressure icon"]
            XCTAssertTrue(pressureIcon.exists, "Pressure icon should exist")
            
            let visibilityIcon = app.images["visibility icon"]
            XCTAssertTrue(visibilityIcon.exists, "Visibility icon should exist")
        }
   
}
