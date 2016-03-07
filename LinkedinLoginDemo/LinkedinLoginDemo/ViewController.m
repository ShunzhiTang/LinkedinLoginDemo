//
//  ViewController.m
//  LinkedinLoginDemo
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 shunzhitang. All rights reserved.
//

#import "ViewController.h"
#import <linkedin-sdk/LISDK.h>

@interface ViewController ()


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

- (void)getInfo{
    
    NSString *urlStr = @"https://api.linkedin.com/v1/people/~";
    //
    if ([LISDKSessionManager hasValidSession]) {
        
        [[LISDKAPIHelper sharedInstance] getRequest:urlStr
                                            success:^(LISDKAPIResponse *response) {
                                                // do something with response
                                                
                                                NSLog(@" %@" , response.data);
                                                NSLog(@" headers = %@" , response.headers);
                                            }
                                              error:^(LISDKAPIError *apiError) {
                                                  
                                                  NSLog(@"  error = %@"  ,apiError);
                                              }];
        
    };
}



@end
