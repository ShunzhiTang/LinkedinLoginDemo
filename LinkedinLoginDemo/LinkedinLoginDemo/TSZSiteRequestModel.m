//
//  TSZSiteRequestModel.m
//  LinkedinLoginDemo
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import "TSZSiteRequestModel.h"

@implementation TSZSiteRequestModel

/**
 工厂模式的 类方法
 */

+ (instancetype)TSZSiteRequestModelWithDict:(NSDictionary *)dict{
    
    
    return  [[self alloc] initWithTSZSiteModelDict:dict];
}


/**
 工厂模式的 对象方法
 */

- (instancetype)initWithTSZSiteModelDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        [self  setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}


/**
    重写这个方法 相当于执行了 runTime
*/

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}



@end
