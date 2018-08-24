//
//  PTLImageTools.m
//  PTLHub
//
//  Created by Roc on 2018/8/17.
//  Copyright © 2018年 ptlCoder. All rights reserved.
//

#import "PTLImageTools.h"
#import <FontAwesomeKit/FontAwesomeKit.h>
#define RGB(R, G, B) [UIColor colorWithRed:(R) / 255.0 green:(G) / 255.0 blue:(B) / 255.0 alpha:1.0]


@implementation PTLImageTools
+ (UIImage *)ptl_Octicons_imageWithIdentifier:(NSString *)identifier {
    
    return [self ptl_Octicons_imageWithIdentifier:identifier color:RGB(130, 130, 130)];
}


+ (UIImage *)ptl_Octicons_imageWithIdentifier:(NSString *)identifier color:(UIColor *)color {
   return [self ptl_Octicons_imageWithIdentifier:identifier color:color size:25];
}


+ (UIImage *)ptl_Octicons_imageWithIdentifier:(NSString *)identifier color:(UIColor *)color size:(CGFloat)size {
    NSError *error = nil;
    FAKOcticons *icon = [FAKOcticons iconWithIdentifier:identifier size:size error:&error];
    if (error) {
        NSLog(@"字体库error：%@",error);
        return nil;
    }
    [icon addAttribute:NSForegroundColorAttributeName value:color];
    UIImage *image = [[icon imageWithSize:CGSizeMake(25, 25)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}


+ (UIImage *)ptl_ionicons_imageWithIdentifier:(NSString *)identifier {
    return [PTLImageTools ptl_ionicons_imageWithIdentifier:identifier color:RGB(130, 130, 130)];
}

+ (UIImage *)ptl_ionicons_imageWithIdentifier:(NSString *)identifier color:(UIColor *)color {
    return [PTLImageTools ptl_ionicons_imageWithIdentifier:identifier color:color size:25];
}

+ (UIImage *)ptl_ionicons_imageWithIdentifier:(NSString *)identifier color:(UIColor *)color size:(CGFloat)size {
    NSError *error = nil;
    
    FAKIonIcons *icon = [FAKIonIcons iconWithIdentifier:[NSString stringWithFormat:@"ion-%@",identifier] size:size error:&error];
    if (error) {
        NSLog(@"字体库error：%@",error);
        return nil;
    }
    [icon addAttribute:NSForegroundColorAttributeName value:color];
    UIImage *image = [[icon imageWithSize:CGSizeMake(25, 25)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
