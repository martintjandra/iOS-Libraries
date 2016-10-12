//
//  UIImage+Base64.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/14/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    func getBase64Image()->UIImage? {
        let dataDecoded : NSData? = NSData(base64EncodedString: self, options: NSDataBase64DecodingOptions(rawValue: 0))
        if dataDecoded == nil { return nil; } else { return UIImage(data: dataDecoded!); }
    }
    
}

extension UIImage {
    
    func getBase64String()->String? {
        let imageData : NSData? = UIImagePNGRepresentation(self);
        return imageData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength);
    }
    
}