//
//  UIImage+Helps.h
//  BaseProject
//
//  Created by RongXing on 2018/11/6.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helps)


/**
  图片旋转  degrees(度数)
 */
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;


/**
 *生成纯颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/**
    将图片分割成两部分
 */
+ (NSArray*)splitImageIntoTwoParts:(UIImage*)image;
@end
