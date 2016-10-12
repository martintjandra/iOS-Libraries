//
//  String+Case.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/5/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    func snakeCase()->String {
        var result = "";
        for i in 0..<self.characters.count {
            let ch = String(self[self.startIndex.advancedBy(i)]);
            if ch.lowercaseString != ch { result += " " }
            result += ch.lowercaseString;
        }
        return result;
    }
    
}