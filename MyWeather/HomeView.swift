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
    
    var body: some View {
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            weatherViewBody
                .task {
                    viewModel.getWeather(latitude: locationManager.latitude, longitude: locationManager.longitude)
                }
        } else {
            ProgressView()
                .ignoresSafeArea()
        }
    }
    
}

extension HomeView {
    private var weatherViewBody: some View {
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                
                VStack {
                    if let weather = viewModel.weather {
                        Text(weather.location?.name ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                            .colorInvert()
                    }
                    
                    if let weather = viewModel.weather {
                        VStack {
                            AsyncImage(url: URL(string: "https:" + "\(weather.current?.condition?.icon ?? "")")) { image in
                                image
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 64, height: 64)
                            }
                            
                            Text((weather.current?.tempC ?? 0).roundDouble() + "°C")
                                .font(.system(size: 50))
                                .fontWeight(.heavy)
                                .colorInvert()
                            Text(weather.current?.condition?.text ?? "")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .colorInvert()
                            Text("Wind: " + (weather.current?.windKph ?? 0).roundDouble() + " km/h")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .colorInvert()
                            Text("Humidity: " + "\(weather.current?.humidity ?? 0)" + " %")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .colorInvert()
                            
                        }
                        .padding()
                        
                    }
                    
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.weather?.forecast?.forecastday ?? []) { weatherDay in
                        HStack(alignment: .center) {
                            if let date = weatherDay.date {
                                if date == Date().stringFromDate() {
                                    Text("Today")
                                        .font(.headline)
                                        .fontWeight(.heavy)
                                        .colorInvert()
                                        .frame(width: 100, alignment: .leading)
                                        .padding(.horizontal, 30)
                                } else {
                                    Text("\((weatherDay.date ?? "").weekday())")
                                        .font(.headline)
                                        .fontWeight(.heavy)
                                        .colorInvert()
                                        .frame(width: 100, alignment: .leading)
                                        .padding(.horizontal, 30)
                                }
                            }
                            
                            VStack {
                                AsyncImage(url: URL(string: "https:" + "\(weatherDay.day?.condition?.icon ?? "")")) { image in
                                    image
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 64, height: 64)
                                }
                                
                                Text((weatherDay.day?.avgtempC ?? 0).roundDouble() + "°C")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .colorInvert()
                                
                            }
                            .frame(width: 64)
                            Spacer()
                            VStack(alignment: .leading) {
                                Text(weatherDay.day?.condition?.text ?? "")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .colorInvert()
                                Text("Wind: " + (weatherDay.day?.maxwindKph ?? 0).roundDouble() + " km/h")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .colorInvert()
                                Text("Humidity: " + "\(weatherDay.day?.avghumidity ?? 0)" + " %")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .colorInvert()
                            }
                            .frame(width: 200, alignment: .leading)
                            
                        }
                        .padding()
                        Divider()
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .ignoresSafeArea()
                
            }
        }
        
        
    }
}



#Preview {
    HomeView()
}
