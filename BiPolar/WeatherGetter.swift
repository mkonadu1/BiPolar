//
//  File.swift
//  BiPolar
//
//  Created by Kwasi Bandoh  on 1/12/18.
//  Copyright © 2018 Kwasi Bandoh. All rights reserved.
//

import Foundation

class WeatherGetter {
    
    private let openWeatherMapBaseURL = "http://api.wunderground.com/api/"
    private let openWeatherMapAPIKey = "7bc46d9a64fab8c0"
    
    func getWeather(city: String) {
        
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)\(openWeatherMapAPIKey)/conditions/q/CA/\(city).json")!
        
        // The data task retrieves the data.
        let myDataTask = session.dataTask(with : weatherRequestURL, completionHandler : { (data, response, error) in
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
                print("Raw data:\n\(data!)\n")
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                print("Human-readable data:\n\(dataString!)")
            }
        })
        
        // The data task is set up...launch it!
        myDataTask.resume()
    }
    
}
