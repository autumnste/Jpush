//
//  ViewController.m
//  极光推送
//
//  Created by WangXinjia on 2018/3/27.
//  Copyright © 2018年 WangXinjia. All rights reserved.
//

#import "ViewController.h"
#import "JSHAREService.h"

@interface ViewController ()
- (IBAction)btn_shair:(id)sender;

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
@end
