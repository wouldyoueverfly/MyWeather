//
//  HomeView.swift
//  MyWeather
//
//  Created by dofxmine on 02.06.2025.
//

import SwiftUI
import CoreLocationUI

struct HomeView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    @StateObject var locationManager = LocationManager()
    
    let today = Date().formatted(.dateTime.month().day())
    
    var body: some View {
            
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                
                VStack {
                    if let weather = viewModel.weather {
                        Text("\(weather.location.name)")
                            .font(.system(size: 45))
                            .fontWeight(.bold)
                            .padding()
                            .colorInvert()
                    }
                    Text("\(today)")
                        .fontWeight(.bold)
                        .colorInvert()
                    
                    if let weather = viewModel.weather {
                        VStack {
                            AsyncImage(url: URL(string: "https:" + "\(weather.current.condition.icon)")) { image in
                                image
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 64, height: 64)
                            }
                            
                            Text(weather.current.tempC.roundDouble() + "°C")
                                .fontWeight(.bold)
                                .colorInvert()
                            Text(weather.current.condition.text)
                                .fontWeight(.bold)
                                .colorInvert()
                            Text("Wind: " + weather.current.windKph.roundDouble() + " km/h")
                                .fontWeight(.bold)
                                .colorInvert()
                            Text("Humidity: " + "\(weather.current.humidity)" + " %")
                                .fontWeight(.bold)
                                .colorInvert()
                            
                        }
                        .padding()
                        
                    }
                    
                }
                
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.weather?.forecast.forecastday ?? []) { weatherDay in
                        HStack(alignment: .top) {
                            VStack {
                                
                                // Date
                                
                                AsyncImage(url: URL(string: "https:" + "\(weatherDay.day.condition.icon)")) { image in
                                    image
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 64, height: 64)
                                }
                                
                                Text(weatherDay.day.avgtempC.roundDouble() + "°C")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .colorInvert()
                                
                            }
                            VStack {
                                Text(weatherDay.day?.condition?.text)
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .colorInvert()
                                Text("Wind: " + weatherDay.day.maxwindKph.roundDouble() + " km/h")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .colorInvert()
                                Text("Humidity: " + weatherDay.day.avghumidity.roundDouble() + " %")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .colorInvert()
                            }
                        }
                        .padding()
                    }
                    
                }
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
                
                
//                LocationButton(.currentLocation) {
//                    locationManager.requestLocation()
//                    if let location = locationManager.location {
//                        viewModel.getWeather(latitude: location.latitude, longitude: location.longitude)
//                    }
//                }
//                .foregroundStyle(.white)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        
    }
    
}

#Preview {
    HomeView()
}
