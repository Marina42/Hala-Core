//
//  HalaSensorManager.swift
//  Hala
//
//  Created by Marina Sauca on 13/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation
//import UIDevice

class HalaSensorManager {
    weak var delegate: HalaSensorDelegate?
    
    private var counter = 0
    
    
    func engageComponent(gpid: String){
        let dicLog: [String : String] = ["sensor":gpid+"-log",
                                      "type":"presence",
                                      "dataType":"text",
                                      "component":gpid]
        let dicFoot: [String: String] = ["sensor":gpid+"-footprint",
                                         "type":"people-flow",
                                         "dataType":"text",
                                         "component":gpid]
        let dict2 = ["sensors" : [dicLog, dicFoot]]
        let urlString: URL = URL(string: "http://api.sentilo.cloud/catalog/HalaMasterMind")!
        var request: URLRequest = URLRequest(url: urlString)
        request.setValue("application/JSON", forHTTPHeaderField: "Accept")
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let data = try! JSONSerialization.data(withJSONObject: dict2, options: JSONSerialization.WritingOptions.prettyPrinted)
        request.httpBody = data
        request.setValue("9474d27ab5df36ebdc966d6ff5a2c019cf05c02587df5eedd216e007eb37f8ea", forHTTPHeaderField: "IDENTITY_KEY")
        
        let dataTask: URLSessionDataTask = URLSession.shared.dataTask(with: request){data, response, error in
            if error != nil{
                print(error!.localizedDescription)
            }
            self.stepIn(gpid: gpid)
        }
        dataTask.resume()
    }
    
    private func stepIn(gpid: String){
       // let vendorUID = UIDevice.currentDevice().identifierForVendor.UUIDString
        let dic: [String : String] = ["value": "ID"]
        let dict2 = ["observations" : [dic]]
        
        let urlString: URL = URL(string: "http://api.sentilo.cloud/data/HalaMasterMind/"+gpid+"-footprint")!
        var request: URLRequest = URLRequest(url: urlString)
        request.setValue("application/JSON", forHTTPHeaderField: "Accept")
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PUT"
        let data = try! JSONSerialization.data(withJSONObject: dict2, options: JSONSerialization.WritingOptions.prettyPrinted)
        request.httpBody = data
        request.setValue("9474d27ab5df36ebdc966d6ff5a2c019cf05c02587df5eedd216e007eb37f8ea", forHTTPHeaderField: "IDENTITY_KEY")
        
        let dataTask: URLSessionDataTask = URLSession.shared.dataTask(with: request){data, response, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                self.delegate?.currentPlaceIsReady()
            }
        }
        dataTask.resume()
    }
    
    
    func createSensor(type: String, place: HalaPlace){
        let dic: [String : String] = ["sensor":place.getGpid()+"-"+type,
                                      "type":"presence",
                                      "dataType":"text",
                                      "component":place.getGpid()]
        let dict2 = ["sensors" : [dic]]
        let urlString: URL = URL(string: "http://api.sentilo.cloud/catalog/HalaMasterMind")!
        var request: URLRequest = URLRequest(url: urlString)
        request.setValue("application/JSON", forHTTPHeaderField: "Accept")
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let data = try! JSONSerialization.data(withJSONObject: dict2, options: JSONSerialization.WritingOptions.prettyPrinted)
        request.httpBody = data
        request.setValue("9474d27ab5df36ebdc966d6ff5a2c019cf05c02587df5eedd216e007eb37f8ea", forHTTPHeaderField: "IDENTITY_KEY")
        
        let dataTask: URLSessionDataTask = URLSession.shared.dataTask(with: request){data, response, error in
            if error != nil {
                
            }
        }
        dataTask.resume()

    }
}
