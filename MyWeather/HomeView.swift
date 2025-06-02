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
            if let location = locationManager.location {
                Text("\(location.latitude), \(location.longitude)")
            }
            List {
                ForEach(viewModel.weather?.forecast?.forecastday ?? []) { item in
                    Text(item.day?.condition?.text ?? "")
                }
            }
            LocationButton(.currentLocation) {
                locationManager.requestLocation()
            }
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    HomeView()
}
