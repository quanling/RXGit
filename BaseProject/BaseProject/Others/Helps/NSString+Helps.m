//
//  NSString+Helps.m
//  BaseProject
//
//  Created by RongXing on 2018/11/6.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "NSString+Helps.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (Helps)
+(NSString *)createAUUID{
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
    return uuidString;
}

+(NSString *)stringPhoneWithId:(id) value{
    NSString *strValue=@"";
    if(value==nil||value==[NSNull null]){
        strValue=@"";
    }else{
        strValue = value;
        strValue = [strValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
        strValue=[strValue stringByReplacingOccurrencesOfString:@" " withString:@""];
        strValue=[strValue stringByReplacingOccurrencesOfString:@"-" withString:@""];
        strValue=[strValue stringByReplacingOccurrencesOfString:@"(" withString:@""];
        strValue=[strValue stringByReplacingOccurrencesOfString:@")" withString:@""];
    }
    return strValue;
}

+(NSString *)stringFullzyPhoneWithId:(id) value{
    NSString *strValue=@"";
    if(value==nil||value==[NSNull null]){
        strValue=@"";
    }else{
        strValue = value;
        strValue = [strValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
        strValue=[strValue stringByReplacingOccurrencesOfString:@" " withString:@""];
        strValue=[strValue stringByReplacingOccurrencesOfString:@"-" withString:@""];
        strValue=[strValue stringByReplacingOccurrencesOfString:@"(" withString:@""];
        strValue=[strValue stringByReplacingOccurrencesOfString:@")" withString:@""];
    }
    if([strValue length]==11){
        strValue = [strValue stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    return strValue;
}

+(NSString *)stringWithId:(id) value{
    NSString *strValue=@"";
    if(value==nil||value==[NSNull null]){
        strValue=@"";
    }else{
        if ([value isKindOfClass:[NSNumber class]]) {
            NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
            strValue = [numberFormatter stringFromNumber:value];
        }else{
            strValue = value;
        }
        strValue = [strValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    }
    return strValue;
}
+(NSString *)stringWithIdCard:(id) value{
    NSString *strValue=@"未知";
    if(value==nil||value==[NSNull null]){
        strValue=@"未知";
    }else{
        if ([value isKindOfClass:[NSNumber class]]) {
            NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
            strValue = [numberFormatter stringFromNumber:value];
        }else{
            strValue = value;
        }
        strValue = [strValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
        if([strValue length]==18){
            strValue=[strValue stringByReplacingCharactersInRange:NSMakeRange(6, 8) withString:@"********"];
        }else if ([strValue length]==15){
            strValue=[strValue stringByReplacingCharactersInRange:NSMakeRange(3, 8) withString:@"********"];
        }
    }
    return strValue;
}
+(NSString *)stringWithDistance:(id) value{
    NSString *strValue=@"未知";
    if(value==nil||value==[NSNull null]){
        strValue=@"未知";
    }else{
        NSInteger distance= [value integerValue];
        if(distance<1000){
            strValue=[NSString stringWithFormat:@"%ld米",distance];
        }else{
            CGFloat f = distance/1000;
            strValue=[NSString stringWithFormat:@"%.1f千米",f];
        }
    }
    return strValue;
}

+(NSInteger)integerWithId:(id) value{
    NSInteger intValue = 0;
    if(value==nil||value==[NSNull null]){
        intValue= 0;
    }else{
        intValue=[value integerValue];
    }
    return intValue;
}

+(CGFloat)floatWithId:(id)value{
    CGFloat intValue = 0;
    if(value==nil||value==[NSNull null]){
        intValue= 0;
    }else{
        intValue=[value floatValue];
    }
    return intValue;
}
//是否为手机号码
+(BOOL)isMobilePhoneNumber:(NSString *)phoneNumber{
    NSString * MOBILE = @"^\\d{11}$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    if ([regextestmobile evaluateWithObject:phoneNumber] == YES){
        return YES;
    }
    else
    {
        return NO;
    }
    return TRUE;
}
//是否为电话号码
+(BOOL)isCallNumber:(NSString *)phoneNumber{
    phoneNumber = [phoneNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    NSString * MOBILE = @"^\\d{11}$";
    
    NSString * NU = @"^(0[0-9]{2,3})?([2-9][0-9]{6,7})+(/-[0-9]{1,4})?$";
    
    NSString * CN = @"^(0[0-9]{2,3})?([2-9][0-9]{6,7})$";
    //regexp=""
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestnu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NU];
    NSPredicate *regextestcn = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CN];
    
    if (([regextestmobile evaluateWithObject:phoneNumber] == YES)
        || ([regextestnu evaluateWithObject:phoneNumber] == YES)
        || ([regextestcn evaluateWithObject:phoneNumber] == YES)
        )
    {
        
    }
    else
    {
        return NO;
    }
    
    return TRUE;
}

+ (BOOL)isEmailAddress:(NSString *)email
{
    NSString * EMAIL = @"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", EMAIL];
    
    if ([regextestmobile evaluateWithObject:email] == YES){
        return YES;
    }else{
        return NO;
    }
}



+(NSString *)getTime:(NSString *)dateStr{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *reDate=[dateFormat dateFromString:dateStr];
    [dateFormat setDateFormat:@"HH:mm"];
    return [dateFormat stringFromDate:reDate];
    
}

+(NSString *)getMonthDay:(NSString *)dateStr{
    dateStr=[[dateStr componentsSeparatedByString:@"."] objectAtIndex:0];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *reDate=[dateFormat dateFromString:dateStr];
    [dateFormat setDateFormat:@"MM-dd"];
    NSString *dateStr2=[dateFormat stringFromDate:reDate];
    return dateStr2;
}

+(NSString *)getYearMonthDayHourMinute:(NSString *)dateStr{
    dateStr=[[dateStr componentsSeparatedByString:@"."] objectAtIndex:0];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *reDate=[dateFormat dateFromString:dateStr];
    [dateFormat setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    NSString *dateStr2=[dateFormat stringFromDate:reDate];
    return dateStr2;
}

+(NSString *)getYearMonthDay:(NSString *)dateStr{
    dateStr=[[dateStr componentsSeparatedByString:@"."] objectAtIndex:0];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *reDate=[dateFormat dateFromString:dateStr];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr2=[dateFormat stringFromDate:reDate];
    return dateStr2;
}
/**
 *获取发布时间
 */
+(NSString *)getPublishTime:(NSString *)dateStr{
    dateStr = [dateStr stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    dateStr=[[dateStr componentsSeparatedByString:@"."] objectAtIndex:0];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *reDate=[dateFormat dateFromString:dateStr];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr2=[dateFormat stringFromDate:reDate];
    NSString *todayStr = [dateFormat stringFromDate:[NSDate date]];
    if([todayStr isEqualToString:dateStr2]){
        [dateFormat setDateFormat:@"HH:mm"];
        NSString *dateStr3=[dateFormat stringFromDate:reDate];
        return dateStr3;
    }else{
        [dateFormat setDateFormat:@"MM-dd"];
        NSString *dateStr3=[dateFormat stringFromDate:reDate];
        return dateStr3;
    }
}
// 时间显示格式转换
+(NSString *)transFromWithTime:(NSString *)start andEndTime:(NSString *)endTime
{
    
    NSMutableString *time = [[NSMutableString alloc] init];
    
    [time appendString:[start substringToIndex:2]];
    [time appendString:@":"];
    [time appendString:[start substringFromIndex:2]];
    [time appendString:@"-"];
    [time appendString:[endTime substringToIndex:2]];
    [time appendString:@":"];
    [time appendString:[endTime substringFromIndex:2]];
    
    return time;
}

+(NSString *)transFromWithTime:(NSString *)dateStr{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMdd"];
    NSDate *reDate=[dateFormat dateFromString:dateStr];
    [dateFormat setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateStr2=[dateFormat stringFromDate:reDate];
    return dateStr2;
}
/**
 *MD5数据加密
 */
+(NSString *)md5:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+(NSString *)jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

+(NSString *)jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}
+(NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

+(NSString *)jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]){
        value = [NSString jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [NSString jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [NSString jsonStringWithArray:object];
    }
    return value;
    
}

// 十六进制转换为普通字符串的。
+ (NSString *)stringFromHexString:(NSString *)hexString { //
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString;
    
    
}
//普通字符串转换为十六进制的。
+ (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++){
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

//// 十六进制转换为普通字符串的。
//+ (NSString *)stringFromHexString:(NSString *)hexString { //
//
//    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
//    bzero(myBuffer, [hexString length] / 2 + 1);
//    for (int i = 0; i < [hexString length] - 1; i += 2) {
//        unsigned int anInt;
//        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
//        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
//        [scanner scanHexInt:&anInt];
//        myBuffer[i / 2] = (char)anInt;
//    }
//    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
//    NSLog(@"------字符串=======%@",unicodeString);
//    return unicodeString;
//
//
//}

// 十六进制转换为普通字符串的。
+ (NSData *)dataFromHexString:(NSString *)hexString { //
    NSInteger length = 0;
    if([hexString length]%2==0){
        length = [hexString length]/2;
    }else{
        length = (int)[hexString length] / 2 + 1;
    }
    
    char *myBuffer = (char *)malloc(length);
    bzero(myBuffer, length);
    
    for (int i = 0; i < length; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr ;
        if(i== [hexString length]-1){
            hexCharStr = [NSString stringWithFormat:@"0%@",[hexString substringWithRange:NSMakeRange(i, 1)]];
        }else{
            hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        }
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    
    return [NSData dataWithBytes:myBuffer length:(int)[hexString length] / 2 + 1];
}

+ (NSString *)hexStringFromData:(NSData *)data{
    Byte *bytes = (Byte *)[data bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[data length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    hexStr = [hexStr uppercaseString];
    return hexStr;
}
@end
