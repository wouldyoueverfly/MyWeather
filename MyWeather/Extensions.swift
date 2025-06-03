//
//  Extensions.swift
//  MyWeather
//
//  Created by dofxmine on 03.06.2025.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension String {
    func weekday() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: self) {
            
            let formatter2 = DateFormatter()
            formatter2.dateFormat = "EEEE"
            
            return formatter2.string(from: date)
        }
        return self
    }
    
    func date() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: self) {
            return date
        }
        return Date()
    }
}

extension Date {
    func stringFromDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let date = formatter.string(from: self)
        return date
    }
}
