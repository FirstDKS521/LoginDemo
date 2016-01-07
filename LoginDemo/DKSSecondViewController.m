//
//  DKSSecondViewController.m
//  Tabbar
//
//  Created by DuKaiShun on 15/12/29.
//  Copyright © 2015年 aDu. All rights reserved.
//

#import "DKSSecondViewController.h"

@interface DKSSecondViewController ()

@end

@implementation DKSSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"注销登录" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 200, 50);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)back
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:@"isLogin"];
    [(UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController popToRootViewControllerAnimated:NO];
//    [self.navigationController popToRootViewControllerAnimated:NO];
}

@end
