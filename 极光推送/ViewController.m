//
//  ViewController.m
//  极光推送
//
//  Created by WangXinjia on 2018/3/27.
//  Copyright © 2018年 WangXinjia. All rights reserved.
//

#import "ViewController.h"
#import "JSHAREService.h"
#import "WeiboSDK.h"
@interface ViewController ()
- (IBAction)btn_shair:(id)sender;
- (IBAction)btn_login:(id)sender;
- (IBAction)btn_WxShair:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn_shair:(id)sender {
    JSHAREMessage *message = [JSHAREMessage message];
    message.text = @"JShare分享";
    message.platform = JSHAREPlatformSinaWeibo;
    message.mediaType = JSHAREText;
    [JSHAREService share:message handler:^(JSHAREState state, NSError *error) {
        NSLog(@"分享回调");
    }
     ];
    
}

- (IBAction)btn_login:(id)sender {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"https://api.weibo.com/oauth2/default.html";
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"ViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (IBAction)btn_WxShair:(id)sender {
    JSHAREMessage *message = [JSHAREMessage message];
    message.text = @"JShare分享";
    message.platform = JSHAREPlatformWechatSession;
    message.mediaType = JSHAREText;
    [JSHAREService share:message handler:^(JSHAREState state, NSError *error) {
        NSLog(@"分享回调");
    }
     ];
}
@end
