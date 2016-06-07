//
//  UIColor+fromHex.m
//
//  Created by Kesava on 07/06/2016.
//  Copyright © 2016 Small Screen Science Ltd. All rights reserved.
//

#import "UIColor+fromHex.h"

@implementation UIColor (fromHex)

+ (UIColor *) colorWithHexValue:(NSString *)hexColorValue withAlphaValue:(CGFloat)aplhaValue
{
    hexColorValue = [[hexColorValue stringByTrimmingCharactersInSet:
                      [NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 7 characters if it includes '#'
    if ([hexColorValue length] < 6)
		return [UIColor blackColor];
    
    // strip # if it appears
    if ([hexColorValue hasPrefix:@"#"])
        hexColorValue = [hexColorValue substringFromIndex:1];
    
    // if the value isn't 6 characters at this point return
    // the color black
    if ([hexColorValue length] != 6)
		return [UIColor blackColor];
    
    //-----------------------------------------
    // Convert hex string to an integer
    //-----------------------------------------
    unsigned int hexint = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexColorValue];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet
                                       characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexint];
    
    //-----------------------------------------
    // Create color object, specifying alpha
    //-----------------------------------------
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:aplhaValue];
    
    return color;
}

@end
