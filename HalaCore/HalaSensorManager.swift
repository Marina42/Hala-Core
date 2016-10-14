//
//  HalaSensorManager.swift
//  Hala
//
//  Created by Marina Sauca on 13/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation

class HalaSensorManager {
    func createSensor(type: String, place: HalaPlace){
        var dic: [String : String] = ["sensor":place.getGpid()+"-"+type,
                                      "type":"presence",
                                      "dataType":"text",
                                      "component":place.getGpid()]
        var dict2 = ["sensors" : [dic]]
        let urlString: URL = URL(string: "http://api.sentilo.cloud/catalog/HalaMasterMind")!
        var request: URLRequest = URLRequest(url: urlString)
        request.setValue("application/JSON", forHTTPHeaderField: "Accept")
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        var data = try! JSONSerialization.data(withJSONObject: dict2, options: JSONSerialization.WritingOptions.prettyPrinted)
        request.httpBody = data
        request.setValue("9474d27ab5df36ebdc966d6ff5a2c019cf05c02587df5eedd216e007eb37f8ea", forHTTPHeaderField: "IDENTITY_KEY")
        
        var dataTask: URLSessionDataTask = URLSession.shared.dataTask(with: request){data, response, error in
            if error != nil {
                
            }
        }
        dataTask.resume()

    }
}
