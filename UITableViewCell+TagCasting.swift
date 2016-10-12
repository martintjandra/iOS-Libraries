//
//  UITableViewCell+TagCasting.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/22/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension UIView {
    
    func image (tag: Int)->UIImageView? { return self.viewWithTag(tag) as? UIImageView; }
    func button (tag: Int)->UIButton? { return self.viewWithTag(tag) as? UIButton; }
    func label (tag: Int)->UILabel? { return self.viewWithTag(tag) as? UILabel; }
    func textField (tag: Int)->UITextField? { return self.viewWithTag(tag) as? UITextField; }
    
}