//
//  ViewController.m
//  OCFlutter
//
//  Created by 李闯 on 2020/4/1.
//  Copyright © 2020 李闯. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/FlutterViewController.h>
#import "LoginViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
}

- (IBAction)jumpToFlutter:(id)sender {
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    flutterViewController.navigationItem.title = @"Flutter";
    [self.navigationController pushViewController:flutterViewController animated:true];
}
- (IBAction)jumpToFlutter2:(id)sender {
    FlutterViewController* flutterViewController = [[FlutterViewController alloc]init];
    [flutterViewController setInitialRoute:@"pag1"];
    
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"com.pages.your/native_get" binaryMessenger:(NSObject<FlutterBinaryMessenger> *)flutterViewController];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSString *method = [call method];
        if ([method isEqualToString:@"FlutterPopIOS"]) {
            NSLog(@"FlutterPopIOS：获取Flutter返回时传的值 == %@",[call arguments]);
            [self.navigationController popViewControllerAnimated:true];
        }
        if ([method isEqualToString:@"FlutterCickedActionPushIOSNewVC"]) {
            NSLog(@"FlutterCickedActionPushIOSNewVC：返回来传的参数是 == %@",[call arguments]);
            LoginViewController *loginCV = [[LoginViewController alloc] init];
            [self.navigationController pushViewController:loginCV animated:true];
        }
        if ([method isEqualToString:@"FlutterGetIOSArguments"]) {
            NSDictionary *dic = @{@"name":@"名字"};
            result(dic);
        }
        
    }];
    [self.navigationController pushViewController:flutterViewController animated:YES];

}

@end
