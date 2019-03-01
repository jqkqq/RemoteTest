//
//  DogViewController.swift
//  PraticeJSON
//
//  Created by swimhead on 2019/2/25.
//  Copyright © 2019 swimhead. All rights reserved.
//

import UIKit
struct Dog: Decodable {
    var status: String
    var message: URL
}

class DogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    private func loadFile() {
        if let url = URL(string: "https://dog.ceo/api/breeds/image/random") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let dog = try JSONDecoder().decode(Dog.self, from: data)
                        print(dog)
                    }catch{
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
