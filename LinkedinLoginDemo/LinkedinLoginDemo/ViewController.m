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
    
    
    NSLog(@"%@" , @"sync  pressed2");
    
    //  LISDK_W_SHARE_PERMISSION, LISDK_RW_COMPANY_ADMIN_PERMISSION, LISDK_CONTACT_INFO_PERMISSION
    
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION , LISDK_EMAILADDRESS_PERMISSION ,nil] state:@"some state" showGoToAppStoreDialog:YES successBlock:^(NSString * returnState) {
        
        NSLog(@"成功的的返回");
        
        NSLog(@"returnState = %@",returnState);
//
        [self getInfo];
        
//        LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
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
    
    NSLog(@"%s","sync pressed3");
    
    
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



@end
