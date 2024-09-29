//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    @StateObject private var vmObj = WeatherViewModel()
    @StateObject private var locationManager = LocationManager()
    @State private var searchText: String = ""
    @State private var showingDetail = false
    var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea(.all) // Fills the entire screen, including safe area
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    HStack {
                        Button(action: {
                            showingDetail = true
                        }) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .foregroundColor(.black)
                                .padding(.leading, 2)
                                .frame(width: 30, height: 30)
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .accessibilityIdentifier("search")
                        }
                        .fullScreenCover(isPresented: $showingDetail , onDismiss: {
                            Task {
                                await loadWeatherDetails(city:searchText)
                            }
                        }) {
                            SearchView(text: $searchText)
                        }
                        // Header Section
                        Text(vmObj.weatherDetails.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .accessibilityIdentifier("location")

                    }
                    VStack {
                        AsyncImage(url: Constants.weatherIcon(vmObj.weatherDetails.weather.first?.icon ?? "")) { image in
                            image.resizable()
                                .frame(width: 100, height: 100)
                                .aspectRatio(contentMode: .fill)
                                .accessibilityIdentifier("weathersymbol")
                        } placeholder: {
                            Image(systemName: "sun.max.fill")
                                .frame(width: 100, height: 100)
                                .foregroundColor(.yellow)
                        }
                        
                        Text(String(format: "%.2f",vmObj.weatherDetails.main.temp).appending(Constants.ForeignHeat))
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .accessibilityIdentifier("temparature")
                        
                        Text(vmObj.weatherDetails.weather.first?.description ?? "")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .accessibilityIdentifier("weather feels like")
                       }
                    .padding(.bottom, 40)
                    
                    // Additional Weather Info Grid
                    HStack(spacing: 30) {
                        VStack {
                            Image(systemName: "wind")
                                .font(.title)
                                .accessibilityIdentifier("wind icon")
                            Text(String(format: "%.2f",vmObj.weatherDetails.wind.speed).appending(Constants.Hz))
                                .font(.body)
                                .foregroundColor(.gray)
                                .accessibilityIdentifier("Wind speed")
                            Text(Constants.Wind)
                                .font(.caption)

                        }
                        
                        VStack {
                            Image(systemName: "drop.fill")
                                .font(.title)
                                .accessibilityIdentifier("humidity icom")
                            Text("\(vmObj.weatherDetails.main.humidity)%")
                                .font(.body)
                                .foregroundColor(.gray)
                                .accessibilityIdentifier("humidity units")

                            Text(Constants.Humidity)
                                .font(.caption)

                        }
                        
                        VStack {
                            Image(systemName: "cloud.rain.fill")
                                .font(.title)
                                .accessibilityIdentifier("pressure icon")

                            Text("\(vmObj.weatherDetails.main.pressure)\(Constants.Hz)")
                                .font(.body)
                                .foregroundColor(.gray)
                                .accessibilityIdentifier("pressure units")

                            Text(Constants.Pressure)
                                .font(.caption)

                        }
                        
                        VStack {
                            Image(systemName: "sun.max.fill")
                                .font(.title)
                                .accessibilityIdentifier("visibility icon")
                            Text("\(vmObj.weatherDetails.visibility)")
                                .font(.body)
                                .foregroundColor(.gray)
                                .accessibilityIdentifier("visibility in units")

                            Text(Constants.Visibility)
                                .font(.caption)
                        }
                    }
                    .padding(.bottom, 40)
                    //  Spacer()
                }.task { @MainActor in
                    let city = await locationManager.getCityName(from: locationManager.location ?? CLLocation())
                    await loadWeatherDetails(city: city ?? "")
                }
                .padding()
            }
    }
    func loadWeatherDetails(city: String) async {
        await vmObj.populateWeatherDetails(city)
    }
}
#Preview {
    WeatherView()
}


