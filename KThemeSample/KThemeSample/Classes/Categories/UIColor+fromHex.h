//
//  UIColor+fromHex.h
//
//  Created by Kesava on 07/06/2016.
//  Copyright © 2016 Small Screen Science Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (fromHex)

+(UIColor *) colorWithHexValue:(NSString *)hexColorValue withAlphaValue:(CGFloat)aplhaValue;

@end
