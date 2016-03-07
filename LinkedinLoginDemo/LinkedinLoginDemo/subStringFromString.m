//
//  subStringFromString.m
//  LinkedinLoginDemo
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import "subStringFromString.h"

@implementation subStringFromString


+ (NSString *)getString:(NSString *)str  fromStr:(NSString *)begin  toStr:(NSString *)end{
    
//    NSRange  range;
//    
//    range =  [str rangeOfString:begin];
//    
//    if (range.length  == 0) {
//        return nil;
//    }
//    
//    str = [str substringFromIndex:range.location];
//    
//    range = [str  rangeOfString:end options:NSBackwardsSearch];
//    
//    
//    
//    NSLog(@"str1111 = %@" , str);
//    
//    if(range.length == 0){
//        return nil;
//    }
//    
//    str = [str substringToIndex:range.location + 1];
//    
//    if ([str isEqualToString:@""]) {
//        return  nil;
//    }
//    
//    return str;
    
    NSRange range;
    range = [str rangeOfString:begin];
    
   
    
    if (range.length == 0) {
        return nil;
    }
    str = [str substringFromIndex:range.location + 1];
    
    
    range = [str rangeOfString:end options:NSBackwardsSearch];
    if (range.length == 0) {
        return nil;
    }
    str = [str substringToIndex:range.location];
    if ([str isEqualToString:@""]) {
        return nil;
    }
    return str;
}

@end
