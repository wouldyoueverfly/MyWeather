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
        VStack {
            if let name = viewModel.weather?.location?.name {
                Text("\(name)")
                    .bold()
            }
            List {
                ForEach(viewModel.weather?.forecast?.forecastday ?? []) { item in
                    HStack {
                        if let url = URL(string: "https:" + "\(item.day?.condition?.icon ?? "")")
                        {
                            AsyncImage(url: url)
                        } else {
                            ProgressView()
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(item.day?.avgtempC ?? 0)" + "°C")
                                    .font(.caption)
                                
                                Text(item.day?.condition?.text ?? "")
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("\(item.day?.maxwindKph ?? 0)" + "k/h")
                                    .font(.caption)
                                
                                Text("\(item.day?.avghumidity ?? 0)" + "%")
                                    .font(.caption)
                            }
                        }
                        
                    }
                }
            }
            LocationButton(.currentLocation) {
                locationManager.requestLocation()
                if let location = locationManager.location {
                    viewModel.getWeather(latitude: location.latitude, longitude: location.longitude)
                }
            }
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    HomeView()
}
