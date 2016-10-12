//
//  NSDate+Convenience.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/22/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension NSDate
{
    convenience init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
    
    func toString (format: String = "dd-MM-yyyy")->String {
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = format;
        return dateFormatter.stringFromDate(self);
    }
    
    
}