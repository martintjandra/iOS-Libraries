//
//  NSUserDefaults+Subscript.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/14/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension NSUserDefaults {
    
    subscript (key: String)->AnyObject? {
        get {
            return self.valueForKey(key);
        }
        set {
            self.setValue(newValue, forKey: key);
        }
    }
    
}