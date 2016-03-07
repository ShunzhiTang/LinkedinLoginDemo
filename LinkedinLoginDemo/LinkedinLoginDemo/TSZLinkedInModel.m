//
//  TSZLinkedInModel.m
//  LinkedinLoginDemo
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import "TSZLinkedInModel.h"

@implementation TSZLinkedInModel

/**
 类方法实现
 */

+ (instancetype)TSZLinkedInModelDict:(NSDictionary *)dict{

    
    return  [[self alloc] initWithLinkedinModelDict:dict];
    
}



/**
 对象方法实现字典转模型
 */

- (instancetype)initWithLinkedinModelDict:(NSDictionary *)dict{
    
    if(self = [super init]){
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


@end
