//
//  UIProgressView+CustomView.swift
//  iOPS
//
//  Created by Martin Tjandra on 10/7/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension UIProgressView {
    public override func sizeThatFits(size: CGSize) -> CGSize {
        let newSize = CGSizeMake(self.frame.size.width, 9);
        return newSize;
    }
}