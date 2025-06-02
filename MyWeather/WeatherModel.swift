//
//  WeatherModel.swift
//  MyWeather
//
//  Created by dofxmine on 01.06.2025.
//
import Foundation

// Weather API Info:
/*
URL:
https://api.weatherapi.com/v1/forecast.json?key=a65e47c3105d4a0ab65161243252905&q=53.50,49.42&days=5&aqi=no&alerts=no

JSONResponse:

{
  "location": {
    "name": "Тольятти",
    "region": "Samara",
    "country": "Russia",
    "lat": 53.523,
    "lon": 49.413,
    "tz_id": "Europe/Samara",
    "localtime_epoch": 1748810569,
    "localtime": "2025-06-02 00:42"
  },
  "current": {
    "last_updated_epoch": 1748809800,
    "last_updated": "2025-06-02 00:30",
    "temp_c": 15.2,
    "temp_f": 59.4,
    "is_day": 0,
    "condition": {
      "text": "Mist",
      "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
      "code": 1030
    },
    "wind_mph": 6.7,
    "wind_kph": 10.8,
    "wind_degree": 248,
    "wind_dir": "WSW",
    "pressure_mb": 1004,
    "pressure_in": 29.65,
    "precip_mm": 0.02,
    "precip_in": 0,
    "humidity": 95,
    "cloud": 99,
    "feelslike_c": 15.2,
    "feelslike_f": 59.4,
    "windchill_c": 15.2,
    "windchill_f": 59.4,
    "heatindex_c": 15.2,
    "heatindex_f": 59.4,
    "dewpoint_c": 14.5,
    "dewpoint_f": 58.1,
    "vis_km": 2,
    "vis_miles": 1,
    "uv": 0,
    "gust_mph": 12.1,
    "gust_kph": 19.4
  },
  "forecast": {
    "forecastday": [
      {
        "date": "2025-06-02",
        "date_epoch": 1748822400,
        "day": {
          "maxtemp_c": 17.9,
          "maxtemp_f": 64.1,
          "mintemp_c": 11.8,
          "mintemp_f": 53.2,
          "avgtemp_c": 15.2,
          "avgtemp_f": 59.3,
          "maxwind_mph": 16.3,
          "maxwind_kph": 26.3,
          "totalprecip_mm": 0.19,
          "totalprecip_in": 0.01,
          "totalsnow_cm": 0,
          "avgvis_km": 9.7,
          "avgvis_miles": 6,
          "avghumidity": 74,
          "daily_will_it_rain": 1,
          "daily_chance_of_rain": 88,
          "daily_will_it_snow": 0,
          "daily_chance_of_snow": 0,
          "condition": {
            "text": "Patchy rain nearby",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
            "code": 1063
          },
          "uv": 1.7
        },
        "astro": {
          "sunrise": "04:19 AM",
          "sunset": "09:03 PM",
          "moonrise": "11:09 AM",
          "moonset": "01:22 AM",
          "moon_phase": "Waxing Crescent",
          "moon_illumination": 38,
          "is_moon_up": 1,
          "is_sun_up": 0
        },
        "hour": []
      },
      {
        "date": "2025-06-03",
        "date_epoch": 1748908800,
        "day": {
          "maxtemp_c": 19.2,
          "maxtemp_f": 66.5,
          "mintemp_c": 11.5,
          "mintemp_f": 52.7,
          "avgtemp_c": 15.7,
          "avgtemp_f": 60.3,
          "maxwind_mph": 11.6,
          "maxwind_kph": 18.7,
          "totalprecip_mm": 0.77,
          "totalprecip_in": 0.03,
          "totalsnow_cm": 0,
          "avgvis_km": 9.6,
          "avgvis_miles": 5,
          "avghumidity": 71,
          "daily_will_it_rain": 1,
          "daily_chance_of_rain": 89,
          "daily_will_it_snow": 0,
          "daily_chance_of_snow": 0,
          "condition": {
            "text": "Patchy rain nearby",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
            "code": 1063
          },
          "uv": 1.8
        },
        "astro": {
          "sunrise": "04:18 AM",
          "sunset": "09:04 PM",
          "moonrise": "12:26 PM",
          "moonset": "01:32 AM",
          "moon_phase": "First Quarter",
          "moon_illumination": 48,
          "is_moon_up": 0,
          "is_sun_up": 0
        },
        "hour": []
      },
      {
        "date": "2025-06-04",
        "date_epoch": 1748995200,
        "day": {
          "maxtemp_c": 14.3,
          "maxtemp_f": 57.8,
          "mintemp_c": 12.5,
          "mintemp_f": 54.6,
          "avgtemp_c": 13.7,
          "avgtemp_f": 56.6,
          "maxwind_mph": 17,
          "maxwind_kph": 27.4,
          "totalprecip_mm": 31.05,
          "totalprecip_in": 1.22,
          "totalsnow_cm": 0,
          "avgvis_km": 7.7,
          "avgvis_miles": 4,
          "avghumidity": 95,
          "daily_will_it_rain": 1,
          "daily_chance_of_rain": 81,
          "daily_will_it_snow": 0,
          "daily_chance_of_snow": 0,
          "condition": {
            "text": "Heavy rain",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/308.png",
            "code": 1195
          },
          "uv": 0.8
        },
        "astro": {
          "sunrise": "04:17 AM",
          "sunset": "09:05 PM",
          "moonrise": "01:41 PM",
          "moonset": "01:40 AM",
          "moon_phase": "Waxing Gibbous",
          "moon_illumination": 58,
          "is_moon_up": 0,
          "is_sun_up": 0
        },
        "hour": []
      },
      {
        "date": "2025-06-05",
        "date_epoch": 1749081600,
        "day": {
          "maxtemp_c": 20.2,
          "maxtemp_f": 68.3,
          "mintemp_c": 11.7,
          "mintemp_f": 53,
          "avgtemp_c": 16.3,
          "avgtemp_f": 61.4,
          "maxwind_mph": 9.4,
          "maxwind_kph": 15.1,
          "totalprecip_mm": 0,
          "totalprecip_in": 0,
          "totalsnow_cm": 0,
          "avgvis_km": 10,
          "avgvis_miles": 6,
          "avghumidity": 69,
          "daily_will_it_rain": 0,
          "daily_chance_of_rain": 0,
          "daily_will_it_snow": 0,
          "daily_chance_of_snow": 0,
          "condition": {
            "text": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
            "code": 1000
          },
          "uv": 2.1
        },
        "astro": {
          "sunrise": "04:16 AM",
          "sunset": "09:06 PM",
          "moonrise": "02:53 PM",
          "moonset": "01:48 AM",
          "moon_phase": "Waxing Gibbous",
          "moon_illumination": 68,
          "is_moon_up": 0,
          "is_sun_up": 0
        },
        "hour": []
      },
      {
        "date": "2025-06-06",
        "date_epoch": 1749168000,
        "day": {
          "maxtemp_c": 21,
          "maxtemp_f": 69.9,
          "mintemp_c": 13.9,
          "mintemp_f": 57,
          "avgtemp_c": 16.6,
          "avgtemp_f": 61.9,
          "maxwind_mph": 6,
          "maxwind_kph": 9.7,
          "totalprecip_mm": 0,
          "totalprecip_in": 0,
          "totalsnow_cm": 0,
          "avgvis_km": 10,
          "avgvis_miles": 6,
          "avghumidity": 72,
          "daily_will_it_rain": 0,
          "daily_chance_of_rain": 0,
          "daily_will_it_snow": 0,
          "daily_chance_of_snow": 0,
          "condition": {
            "text": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
            "code": 1000
          },
          "uv": 5
        },
        "astro": {
          "sunrise": "04:16 AM",
          "sunset": "09:07 PM",
          "moonrise": "04:06 PM",
          "moonset": "01:55 AM",
          "moon_phase": "Waxing Gibbous",
          "moon_illumination": 76,
          "is_moon_up": 0,
          "is_sun_up": 0
        },
        "hour": []
      }
    ]
  }
}
*/

// MARK: - Welcome
struct WeatherModel: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Int?
    let lastUpdated: String?
    let tempC, tempF: Double?
    let isDay: Int?
    let condition: Condition?
    let windMph, windKph: Double?
    let windDegree: Int?
    let windDir: String?
    let pressureMB: Int?
    let pressureIn, precipMm, precipIn: Double?
    let humidity, cloud: Int?
    let feelslikeC, feelslikeF, windchillC, windchillF: Double?
    let heatindexC, heatindexF, dewpointC, dewpointF: Double?
    let visKM, visMiles: Int?
    let uv, gustMph, gustKph: Double?
    let timeEpoch: Int?
    let time: String?
    let snowCM, willItRain, chanceOfRain, willItSnow: Int?
    let chanceOfSnow: Int?
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case timeEpoch = "time_epoch"
        case time
        case snowCM = "snow_cm"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String?
    let icon: String?
    let code: Int?
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Identifiable, Codable {
    let id: String = UUID().uuidString
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let astro: Astro?
    let hour: [Current]?
    
    enum CodingKeys: String, CodingKey {
        case date, day, astro, hour
        case dateEpoch = "date_epoch"
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String?
    let moonPhase: String?
    let moonIllumination, isMoonUp, isSunUp: Int?
    
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double?
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double?
    let totalprecipMm, totalprecipIn: Double?
    let totalsnowCM: Int?
    let avgvisKM: Double?
    let avgvisMiles, avghumidity, dailyWillItRain, dailyChanceOfRain: Int?
    let dailyWillItSnow, dailyChanceOfSnow: Int?
    let condition: Condition?
    let uv: Double?
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String?
    let lat, lon: Double?
    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?
    
    enum CodingKeys: String, CodingKey {
        case name, region, country
        case lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
