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
                do {
                    // Try to convert that data into a Swift dictionary
                    let weather = try JSONSerialization.jsonObject(with:
                        data!,
                        options: .allowFragments) as! [String: AnyObject]
                    
                    // If we made it to this point, we've successfully converted the
                    // JSON-formatted weather data into a Swift dictionary.
                    // Let's print its contents to the debug console.
                    print(weather)
                    //print("City: \(weather["city"]!)")
                    
                    let currObserv = weather["current_observation"]
                    let dispLoc = currObserv!["display_location"]!!["city"]
                    
                    
                }
                catch let jsonError as NSError {
                    // An error occurred while trying to convert the data into a Swift dictionary.
                    print("JSON error description: \(jsonError.description)")
                }
            }
        })
            
            // The data task is set up...launch it!
            myDataTask.resume()
    }
    
}
