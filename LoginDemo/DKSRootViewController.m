//
//  DKSRootViewController.m
//  Tabbar
//
//  Created by DuKaiShun on 15/12/29.
//  Copyright © 2015年 aDu. All rights reserved.
//

#import "DKSRootViewController.h"
#import "DKSFirstViewController.h"
#import "DKSSecondViewController.h"
#import "DKSThirdViewController.h"

@interface DKSRootViewController ()

@end

@implementation DKSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    [self loadViewController];
}

- (void)loadViewController
{
    DKSFirstViewController * firstVC = [[DKSFirstViewController alloc] init];
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:firstVC];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:100];
    nav1.tabBarItem.title = @"第一张";
    firstVC.navigationItem.title = @"第一页";
    
    DKSSecondViewController * secondVC = [[DKSSecondViewController alloc] init];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:secondVC];
    nav2.tabBarItem.title = @"第二张";
    secondVC.navigationItem.title = @"第二页";
    
    DKSThirdViewController * thirdVC = [[DKSThirdViewController alloc] init];
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    nav3.tabBarItem.title = @"第三张";
    thirdVC.navigationItem.title = @"第三页";
    
    self.viewControllers = @[nav1, nav2, nav3];
}

@end
