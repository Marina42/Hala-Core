//
//  HalaPlaceManager.swift
//  Hala
//
//  Created by Marina Sauca on 11/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation
import GooglePlaces

class HalaPlaceManager{
    weak var delegate: HalaPlaceManagerDelegate?
    var placesClient: GMSPlacesClient?
    var myPlace: HalaPlace?
    
    init(){
        placesClient = GMSPlacesClient.shared()
    }
    
    func findActualPlace(){
        placesClient?.currentPlace(callback: {
            (placeLikelihoodList: GMSPlaceLikelihoodList?, error: Error?) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.myPlace = HalaPlace(gpid: place.placeID, name: place.name, address: place.formattedAddress!.components(separatedBy: ", ").joined(separator: "\n"), coord: place.coordinate)
                    self.delegate?.placeIsReady(myPlace: self.myPlace!)
                }
            }
        })
    }
}
