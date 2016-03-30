//
//  TSZSiteRequestModel.h
//  LinkedinLoginDemo
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBSiteRequestModel : NSObject

/**
 url  linked iN的个人中心
 */
@property (nonatomic ,strong) NSString *url;

/**
    工厂模式的 类方法
 */

+ (instancetype)TSZSiteRequestModelWithDict:(NSDictionary *)dict;


/**
 工厂模式的 对象方法
 */

- (instancetype)initWithTSZSiteModelDict:(NSDictionary *)dict;


@end
