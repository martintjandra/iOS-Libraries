//
//  Array+Random.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/22/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension Array {
    
    func random()->Element{
        return self[Int(arc4random_uniform(UInt32(self.count)))];
    }
}