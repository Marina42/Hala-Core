//
//  HalaPlace.swift
//  Hala
//
//  Created by Marina Sauca on 11/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation
import CoreLocation

public class HalaPlace {
    private var gpid: String?
    private var name: String?
    private var address: String?
    private var coordinates: CLLocationCoordinate2D?
    
    public init(gpid: String, name: String, address: String, coord: CLLocationCoordinate2D){
        self.gpid = gpid
        self.name = name
        self.address = address
        self.coordinates = coord
    }
    func getGpid() -> String{
        return self.gpid!
    }
    public func getCoords() -> CLLocationCoordinate2D{
        return self.coordinates!
    }
    public func getName() -> String{
        return self.name!
    }
    public func getAddress() -> String{
        return self.address!
    }
}
