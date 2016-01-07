//
//  DKSLoginViewController.m
//  Tabbar
//
//  Created by DuKaiShun on 15/12/29.
//  Copyright © 2015年 aDu. All rights reserved.
//

#import "DKSLoginViewController.h"
#import "DKSRegisterViewController.h"
#import "DKSRootViewController.h"

@interface DKSLoginViewController ()

@end

@implementation DKSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];

    self.title = @"登录";
    self.navigationController.navigationBar.translucent = NO;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [user objectForKey:@"isLogin"];
    if (isLogin) {
        [self isLogin];
    }
}

/**
 *当注销登录时，出现这个页面，让他的导航栏重新显示
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = NO;
}

/**
 *登录
 */
- (IBAction)loginButton:(id)sender
{
    __weak DKSLoginViewController *loginVC = self;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [user objectForKey:@"login"];
    if (self.userField.text == dic[@"suer"] || self.passwordField.text == dic[@"password"]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            DKSRootViewController * rootVC = [[DKSRootViewController alloc] init];
            [loginVC.navigationController pushViewController:rootVC animated:NO];
            loginVC.navigationController.navigationBar.hidden = YES;
            loginVC.navigationController.navigationItem.leftBarButtonItem = nil;
        });
    }
    [user setBool:YES forKey:@"isLogin"];
}

/**
 *注册
 */
- (IBAction)registerButton:(id)sender
{
    __weak DKSLoginViewController * loginVC = self;
    DKSRegisterViewController * registerVC = [[DKSRegisterViewController alloc] init];
    [registerVC setBlock:^(NSString *user, NSString *password) {
        loginVC.userField.text = user;
        loginVC.passwordField.text = password;
    }];
    [self.navigationController pushViewController:registerVC animated:YES];
}

/**
 *如果是已经登录了
 */
- (void)isLogin
{
    DKSRootViewController *rootVC = [[DKSRootViewController alloc] init];
    [self.navigationController pushViewController:rootVC animated:NO];
    self.navigationController.navigationBar.hidden = YES;
    //self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationItem.leftBarButtonItem = nil;
}

/**
 *手机号码验证
 */
+ (BOOL)validateMobile:(NSString *)mobile
{
    if (mobile.length != 11) {
        return NO;
    }
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1[3|4|5|6|7|8|9][0-9]\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

@end
