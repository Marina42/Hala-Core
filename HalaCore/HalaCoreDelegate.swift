//
//  HalaCoreDelegate.swift
//  Hala
//
//  Created by Marina Sauca on 12/10/2016.
//  Copyright © 2016 Hala. All rights reserved.
//

import Foundation

public protocol HalaCoreDelegate: class{
    func halaPlaceIsReady(place: HalaPlace)
    func didEnterHalaPlace()
}
