//
//  ViewController.m
//  LinkedinLoginDemo
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import "ViewController.h"
#import <linkedin-sdk/LISDK.h>
#import "TSZSiteRequestModel.h"

#import "TSZLinkedInModel.h"
#import "subStringFromString.h"
//#import "JSONKit.h"
@interface ViewController ()

@property (nonatomic ,strong) TSZLinkedInModel *linkedModel;

@property (nonatomic ,strong) TSZSiteRequestModel *resquestModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)linkedInLoginButton:(id)sender {
    
    
    //  LISDK_W_SHARE_PERMISSION, LISDK_RW_COMPANY_ADMIN_PERMISSION, LISDK_CONTACT_INFO_PERMISSION
    
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION , LISDK_EMAILADDRESS_PERMISSION ,LISDK_W_SHARE_PERMISSION,nil] state:@"some state" showGoToAppStoreDialog:YES successBlock:^(NSString * returnState) {
        
        NSLog(@"成功的的返回");
        
        NSLog(@"returnState = %@",returnState);
//
        [self getInfo];
        
//        [self shareLinked];
        
        
//
        
        LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
//
//         NSLog(@"value=%@ isvalid=%@",[session value],[session isValid] ? @"YES" : @"NO");
//        
//        NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
//        
//        [text appendString:[NSString stringWithFormat:@",state=\"%@\"",returnState]];
//        
//        NSLog(@"Response label text %@",text);
        
        
        
        
    } errorBlock:^(NSError * error) {
        
        
        NSLog(@"%@" , error);
    }];
    
    
}

/*
 
 {
 "firstName": "Mobobox",
 "headline": "Mobobox at Mobobox",
 "id": "Q4UK11pOsx",
 "lastName": "Mobobox",
 "siteStandardProfileRequest": {"url": "https://www.linkedin.com/profile/view?id=AAoAABxMN6oB2h2MJcDZQi5YrNevgw-FyPplHng&authType=name&authToken=y50Q&trk=api*a4774081*s5090721*"}
 }
 
 */


- (void)getInfo{
    
    NSString *urlStr = @"https://api.linkedin.com/v1/people/~";
    //
    
//    NSLog(@"")
    
    if ([LISDKSessionManager hasValidSession]) {
        
        [[LISDKAPIHelper sharedInstance] getRequest:urlStr
                                            success:^(LISDKAPIResponse *response) {
                                                
                                                NSError *error = nil;
                                                
                                                NSLog(@" %@" , response.data);
                                                
//                                                NSLog(@" headers = %@" , response.headers);
                                                
//                                                NSString *str = [subStringFromString getString:response.data fromStr:@"{" toStr:@"}"];
//                                                
//                                                NSString *strUrl = [subStringFromString getString:str fromStr:@"{" toStr:@"}"];
                                                
                                                NSData *data = [response.data  dataUsingEncoding:NSUTF8StringEncoding];
                                                
                                                
                                                id  obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                                
                                                
                                                NSDictionary *dict = (NSDictionary *)obj;
                                                
                                                self.linkedModel = [[TSZLinkedInModel alloc]initWithLinkedinModelDict:dict];
                                                
                                                
//                                                self.resquestModel = self.linkedModel.siteStandardProfileRequest;
                                                
                                                NSDictionary  *dictRes= (NSDictionary *) self.linkedModel.siteStandardProfileRequest;
                                                
                                                self.resquestModel = [[TSZSiteRequestModel alloc] initWithTSZSiteModelDict:dictRes];
                                                
                                                
                                                self.linkedModel.siteStandardProfileRequest = self.resquestModel;
                                                
                                                
                                                NSLog(@"url = %@" , self.linkedModel.siteStandardProfileRequest.url);
                                                
                                                NSLog(@"headline = %@" , self.linkedModel.headline);
                                                NSLog(@"first = %@" , self.linkedModel.firstName);
//                                                self.linkedModel =
                                                
                                            }
                                              error:^(LISDKAPIError *apiError) {
                                                  
                                                  NSLog(@"  error = %@"  ,apiError);
                                              }];
    };
    
}



- (IBAction)clickShareButton:(UIButton *)sender {
    
    // 分享
//    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION , LISDK_EMAILADDRESS_PERMISSION ,LISDK_W_SHARE_PERMISSION,nil] state:@"some state" showGoToAppStoreDialog:YES successBlock:^(NSString * returnState) {
//        
//        NSLog(@"成功的的返回");
//        
//        NSLog(@"returnState = %@",returnState);
//        
//        
//        [self shareLinked];
//        
//        
//    } errorBlock:^(NSError * error) {
//        
//        
//        NSLog(@"%@" , error);
//    }];
    
    
    
//    NSURL * myURL_APP_A = [NSURL URLWithString:@"LinkedinLoginDemo://www.bdsa"];
//    
//    if ([[UIApplication sharedApplication] canOpenURL:myURL_APP_A]) {
//        NSLog(@"canOpenURL");
//        
//        [[UIApplication sharedApplication] openURL:myURL_APP_A ];
//    }
    
     [self shareLinked];
    
}


- (void) shareLinked{
    
    
    NSString *url = @"https://api.linkedin.com/v1/people/~/shares";  //?format=json

    NSDictionary *update = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [[NSDictionary alloc]
                             initWithObjectsAndKeys:
                             @"anyone",@"code",nil], @"visibility",
                            
                            [[NSDictionary alloc]
                             initWithObjectsAndKeys:
                             @"HAAA312312312",@"title",
                             @"very 大神大神大神大神 good",@"description",
                             @"www.baidu.com",@"submitted-url",
                             nil,@"submitted-image-url",
                             nil], @"content",
                            
                            
                            @"neirong纷纷开发开放经济开发空间 ", @"comment", nil];
    
    
    NSError *error = nil;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:update options:NSJSONWritingPrettyPrinted error:&error];
    NSString *payload = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //    NSString *payload = [self HTTPBodyWithParameters:payDict];
    
    NSLog(@"payload -=  %@" , payload);
    
    LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
    
    NSLog(@"value=%@ isvalid=%@",[session value],[session isValid] ? @"YES" : @"NO");
    
//    NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];


//    NSLog(@"Response label text %@",text);
    
    if ([LISDKSessionManager hasValidSession]) {
        
        [[LISDKAPIHelper sharedInstance] postRequest:url stringBody:payload
                                             success:^(LISDKAPIResponse *response) {
                                                 // do something with response
                                                 
                                                 NSLog(@"share response = %@" , response.data);
                                                 
                                                 
                                             }
                                               error:^(LISDKAPIError *apiError) {
                                                   
                                                   
                                                   NSLog(@"%@" ,apiError);
                                               }
         ];
        
    };
}


- (NSString *)HTTPBodyWithParameters:(NSDictionary *)parameters{
    
    NSMutableArray *paramtersArray = [NSMutableArray array];
    
    for (NSString  *key in [parameters allKeys]) {
        
        id value = [parameters objectForKey:key];
        
        if ([value isKindOfClass:[NSString class]]) {
            
            [paramtersArray addObject:[NSString stringWithFormat:@"%@=%@",key,value]];
        }
    }
    return [paramtersArray componentsJoinedByString:@"&"];
}

- (IBAction)clickInstagramBtn:(id)sender {
    
//    NSURL *instagramURL = [NSURL URLWithString:@"instagram://location?id=1"];
//    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
//        [[UIApplication sharedApplication] openURL:instagramURL];
//}
  
    NSLog(@"instagram ");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://instagram.com/"]];
    
}



@end
