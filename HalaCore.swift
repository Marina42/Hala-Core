//
//  HalaCore.swift
//  HalaCore
//
//  Created by Marina Sauca on 10/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation
import GooglePlaces

public class Hala: HalaPlaceManagerDelegate{
    public weak var delegate: HalaCoreDelegate?
    public static let core = Hala()
    private let placeManager: HalaPlaceManager?
    private var counter = 0;
    private var place: HalaPlace?
    
    
    private init(){
        GMSPlacesClient.provideAPIKey("AIzaSyD1OKwaXi5RSHOSlsrgQFlVUcQiVOjxu14")
        placeManager = HalaPlaceManager()
        placeManager?.delegate = self
        
    }
    public func getActualPlace(){
        placeManager?.findActualPlace()
    }
    
    public func enterActualPlace(){
        
    }
    
    func placeIsReady(myPlace: HalaPlace) {
        place = myPlace
        self.delegate?.halaPlaceIsReady(place: myPlace)
    }
}

