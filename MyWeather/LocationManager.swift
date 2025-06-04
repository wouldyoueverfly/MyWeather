//
//  LocationManager.swift
//  MyWeather
//
//  Created by dofxmine on 02.06.2025.
//

// self.latitude = 55.69466
// self.longitude = 37.67645

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    var latitude: Double {
        manager.location?.coordinate.latitude ?? 55.69466
    }
    
    var longitude: Double {
        manager.location?.coordinate.longitude ?? 37.67645
    }
    
    override init() {
        super.init()
        manager.delegate = self
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            authorizationStatus = .authorizedWhenInUse
            manager.requestLocation()
            break
        case .restricted:
            authorizationStatus = .restricted
            break
            case .denied:
            authorizationStatus = .denied
            break
        case .notDetermined:
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location: \(error.localizedDescription)")
    }
}
