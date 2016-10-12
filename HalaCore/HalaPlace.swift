//
//  HalaPlace.swift
//  Hala
//
//  Created by Marina Sauca on 11/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation

public class HalaPlace {
    private var gpid: String?
    private var name: String?
    private var address: String?
    
    public init(gpid: String, name: String, address: String){
        self.gpid = gpid
        self.name = name
        self.address = address
    }
    func getGpid() -> String{
        return self.gpid!
    }
    public func getName() -> String{
        return self.name!
    }
    public func getAddress() -> String{
        return self.address!
    }
}
