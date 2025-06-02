//
//  WeatherViewModel.swift
//  MyWeather
//
//  Created by dofxmine on 02.06.2025.
//

import Foundation
import Combine
import CoreLocation

class WeatherViewModel: ObservableObject {
    
    @Published var weather: WeatherModel?
    var cancellables = Set<AnyCancellable>()
    var latitude, longitude: CLLocationDegrees
    
    init() {
        self.latitude = 55.69466
        self.longitude = 37.67645
        getWeather(latitude: self.latitude, longitude: self.longitude)
    }
    
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=a65e47c3105d4a0ab65161243252905&q=\(latitude),\(longitude)&days=5&aqi=no&alerts=no") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap(handleOutput)
            .decode(type: WeatherModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: handleCompletion, receiveValue: { [weak self] returnedWeather in
                print(Thread.current)
                self?.weather = returnedWeather
            })
            .store(in: &cancellables)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    private func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
