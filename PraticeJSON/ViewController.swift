//
//  ViewController.swift
//  PraticeJSON
//
//  Created by swimhead on 2019/2/22.
//  Copyright © 2019 swimhead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFile()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func loadFile() {
        guard let fileURL = Bundle.main.url(forResource: "City", withExtension: "txt") else {
            return
        }
        do {
            let fileData = try Data(contentsOf: fileURL)
            let city = try JSONDecoder().decode(City.self, from: fileData)
            print(city)
            let cityData = try JSONEncoder().encode(city)
            let cityString = String(data: cityData, encoding: .utf8)
            print(cityString ?? "")
        }catch{
            print(error)
        }
    }
    
}

struct City: Codable {
    var country: [Country]
}
struct Country: Codable {
    var name: String
    var eName: String
}


