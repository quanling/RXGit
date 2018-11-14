//
//  QLTools.h
//  BaseProject
//
//  Created by RongXing on 2018/11/6.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MBProgressHUD.h"

@interface QLTools : NSObject







#pragma mark -- 字符串base64加密转换 Base64<-->string

/**
 * 将文本转换为base64格式字符串
 */
+ (NSString *)base64StringFromText:(NSString *)text;

/**
 *  将base64格式字符串转换为文本
 */
+ (NSString *)textFromBase64String:(NSString *)base64;


#pragma mark -- MBProgressHUBD 方法扩展
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;

+ (void)loadingToView:(UIView *)view;


@end
