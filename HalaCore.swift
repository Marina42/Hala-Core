//
//  HalaCore.swift
//  HalaCore
//
//  Created by Marina Sauca on 10/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation
import GooglePlaces

public class Hala: HalaPlaceManagerDelegate, HalaSensorDelegate{
    public weak var delegate: HalaCoreDelegate?
    public static let core = Hala()
    private let placeManager: HalaPlaceManager?
    private let sensorManager: HalaSensorManager?
    private var counter = 0;
    private var place: HalaPlace?
    private var sensorsToCreate = [String]()
    var username = "Anon"
    
    
    private init(){
        GMSPlacesClient.provideAPIKey("AIzaSyD5Q4ODoIzsLMhGeuRMZ2Jf8z5_YGxKfUU")
        placeManager = HalaPlaceManager()
        sensorManager = HalaSensorManager()
        placeManager?.delegate = self
        sensorManager?.delegate = self
        
    }
    
    public func changeUsername(newUsername: String){
        self.username = newUsername
    }
    
    public func getCurrentPlace(){
        placeManager?.findActualPlace()
    }
    
    public func currentPlaceIsReady(){
        self.delegate?.didEnterHalaPlace()
    }
    
    public func enterCurrentPlace(){
        sensorManager?.engageComponent(gpid: (place?.getGpid())!)
        /*
         
 
        */
        
        
        
        /*if Component exists {
            get list of sensors
            iterate list, do all of them exist? {
                log in every one what needs to be logged
            }
            else {create the needed ones}
            call delegate method that place is ready
        }
        else {
            create component
            create default sensors (log & footprint)
            log in each one
            call delegate method that place is ready
        }
        */
    }
    
    func placeIsReady(myPlace: HalaPlace) {
        place = myPlace
        self.delegate?.halaPlaceIsReady(place: myPlace)
    }
}

