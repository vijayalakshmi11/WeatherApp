//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject private var coordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
            coordinator.currentView
        }
    }
}
