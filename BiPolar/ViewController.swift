//
//  ViewController.swift
//  BiPolar
//
//  Created by Kwasi Bandoh  on 1/12/18.
//  Copyright © 2018 Kwasi Bandoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet var myView: UIView!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "spiration-dark.png")
        backgroundImg.backgroundColor = UIColor(patternImage: img!)
        
        let weather = WeatherGetter()
        weather.getWeather(city: "San_Francisco")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

