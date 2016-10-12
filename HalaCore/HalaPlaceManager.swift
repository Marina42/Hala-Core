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
    var placesClient: GMSPlacesClient?
    
    init(){}
    
    func findActualPlace(completion: (_: HalaPlace) -> Void){
        placesClient?.currentPlace(callback: completion(place)) -> Void in
        
        
        let place = HalaPlace(gpid: "1", name: "test OK", address: "test street")
        completion(place)
    }
    
    /*func getActualPlace(){
        placesClient?.currentPlace(callback: {
            (placeLikelihoodList: GMSPlaceLikelihoodList?, error: Error?) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    let actualPlace = HalaPlace(gpid: place.placeID, name: place.name, address: place.formattedAddress!.components(separatedBy: ", ").joined(separator: "\n"))
                    self.sendPlace(actualPlace: actualPlace)
                }
            }
        } )
    }
    
    
    func sendPlace(actualPlace: HalaPlace){
        
    }*/
}
