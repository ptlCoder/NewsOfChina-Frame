//
//  PTLImageTools.h
//  PTLHub
//
//  Created by Roc on 2018/8/17.
//  Copyright © 2018年 ptlCoder. All rights reserved.
//
/**
 Octicons字体库identifier: https://octicons.github.com
 ionicons字体库identifier: https://ionicons.com
 更多详见FontAwesomeKit：https://github.com/ptlCoder/FontAwesomeKit
 */
#import <UIKit/UIKit.h>

@interface PTLImageTools : NSObject

/**
 Octicons字体库 通过图片名ID获取UIImage
 
 @param identifier 图片的ID
 @param color 颜色
 @param size 大小
 @return 图片
 */
+ (UIImage *)ptl_Octicons_imageWithIdentifier:(NSString *)identifier color:(UIColor *)color size:(CGFloat)size;
+ (UIImage *)ptl_Octicons_imageWithIdentifier:(NSString *)identifier color:(UIColor *)color;
+ (UIImage *)ptl_Octicons_imageWithIdentifier:(NSString *)identifier;

/**
 ionicons字体库 通过图片名ID获取UIImage
 
 @param identifier 图片的ID
 @param color 颜色
 @param size 大小
 @return 图片
 */
+ (UIImage *)ptl_ionicons_imageWithIdentifier:(NSString *)identifier color:(UIColor *)color size:(CGFloat)size;
+ (UIImage *)ptl_ionicons_imageWithIdentifier:(NSString *)identifier color:(UIColor *)color;
+ (UIImage *)ptl_ionicons_imageWithIdentifier:(NSString *)identifier;

@end
