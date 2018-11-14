//
//  NSString+Helps.h
//  BaseProject
//
//  Created by RongXing on 2018/11/6.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Helps)

+(NSString *)createAUUID;
+(NSString *)stringPhoneWithId:(id) value;
+(NSString *)stringWithId:(id) value;
+(NSString *)stringFullzyPhoneWithId:(id) value;
+(NSString *)stringWithDistance:(id) value;
+(NSString *)stringWithIdCard:(id) value;
+(NSInteger)integerWithId:(id) value;
+(CGFloat )floatWithId:(id)value;
//是否为手机号码
+(BOOL)isMobilePhoneNumber:(NSString *)phoneNumber;
//是否为电话号码
+(BOOL)isCallNumber:(NSString *)phoneNumber;

/**
 *正则判断邮箱地址格式
 */
+(BOOL)isEmailAddress:(NSString *)email;

+(NSString *)getTime:(NSString *)dateStr;

+(NSString *)getMonthDay:(NSString *)dateStr;

+(NSString *)getYearMonthDayHourMinute:(NSString *)dateStr;

+(NSString *)getYearMonthDay:(NSString *)dateStr;
/**
 *获取发布时间
 */
+(NSString *)getPublishTime:(NSString *)dateStr;
//时间格式
+(NSString *)transFromWithTime:(NSString *)start andEndTime:(NSString *)endTime;

+(NSString *)transFromWithTime:(NSString *)dateStr;
/**
 *MD5数据加密
 */
+(NSString *)md5:(NSString *)str;

+(NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;

+(NSString *)jsonStringWithArray:(NSArray *)array;

+(NSString *)jsonStringWithString:(NSString *) string;

+(NSString *)jsonStringWithObject:(id) object;

// 十六进制转换为普通字符串的。
+ (NSString *)stringFromHexString:(NSString *)hexString;
//普通字符串转换为十六进制的。
+ (NSString *)hexStringFromString:(NSString *)string;
// 十六进制转换为普通字符串的。
+ (NSData *)dataFromHexString:(NSString *)hexString;
//普通字符串转换为十六进制的。
+ (NSString *)hexStringFromData:(NSData *)data;

@end
