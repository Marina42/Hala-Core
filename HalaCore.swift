//
//  HalaCore.swift
//  HalaCore
//
//  Created by Marina Sauca on 10/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation

public class Hala{
    public static let core = Hala()
    private let placeManager: HalaPlaceManager?
    private var counter = 0;
    private var place: HalaPlace?
    
    
    private init(){
        placeManager = HalaPlaceManager()
    }
    public func test(){
        print("FrameWork works")
    }
    public func getActualPlace() -> HalaPlace{
        placeManager?.findActualPlace(completion: {(myPlace: HalaPlace) -> Void in
            self.place = myPlace
        })
        return self.place!
    }
}

