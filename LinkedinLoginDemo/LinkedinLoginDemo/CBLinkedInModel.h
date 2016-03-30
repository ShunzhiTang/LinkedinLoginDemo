//
//  TSZLinkedInModel.h
//  LinkedinLoginDemo
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBSiteRequestModel.h"


@interface CBLinkedInModel : NSObject

/**
 firstName  第一个名字
 */
@property (nonatomic ,strong) NSString *firstName;


/**
 lastName 最后一个名字
 */
@property (nonatomic ,strong) NSString *lastName;


/**
 headline  下面的名字
 */
@property (nonatomic ,strong) NSString *headline;

/**
 id  linked 的唯一标识符
 */
@property (nonatomic ,strong) NSString *id;

/**
 siteStandardProfileRequest 这个得到的数据的模型
 
 */
@property (nonatomic ,strong) CBSiteRequestModel *siteStandardProfileRequest;


/**
    类方法实现
 */

+ (instancetype)TSZLinkedInModelDict:(NSDictionary *)dict;



/**
    对象方法实现字典转模型
 */

- (instancetype)initWithLinkedinModelDict:(NSDictionary *)dict;


@end
