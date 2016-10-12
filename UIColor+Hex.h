//
//  UIColor+Hex.h
//  iOPS
//
//  Created by Martin Darma Kusuma Tjandra on 7/19/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;
+ (UIColor *) colorWithHexString: (NSString *) hexString;

@end
