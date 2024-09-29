//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var currentView: AnyView = AnyView(WeatherView())
}
