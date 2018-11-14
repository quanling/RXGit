//
//  UIFont+Helps.m
//  BaseProject
//
//  Created by RongXing on 2018/11/6.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "UIFont+Helps.h"

@implementation UIFont (Helps)
+(UIFont *)fontOfRobotoLightWithSize:(CGFloat)fontSize{
    return [self fontWithName:@"Roboto-Light" size:fontSize];
}

+(UIFont *)fontOfRobotoMedumWithSize:(CGFloat)fontSize{
    return [self fontWithName:@"Roboto-Medium" size:fontSize];
}

+(UIFont *)fontOfRobotoRegularWithSize:(CGFloat)fontSize{
    return [self fontWithName:@"Roboto-Regular" size:fontSize];
}
@end
