//
//  AppDelegate.m
//  LoginDemo
//
//  Created by DuKaiShun on 16/1/7.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "DKSAppDelegate.h"
#import "DKSRootViewController.h"
#import "DKSLoginViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface DKSAppDelegate ()

@end

static NSString *appKey = @"e4231f9d405c";
static NSString *appSecret = @"f4d548f5a85b0762931cac5403be64d6";
@implementation DKSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //初始化应用，appKey和appSecret从后台申请得
    [SMSSDK registerApp:appKey
             withSecret:appSecret];
    
    //第一种方法
    //    DKSRootViewController * rootVC = [[DKSRootViewController alloc] init];
    //    self.window.rootViewController = rootVC;
    //
    //    DKSLoginViewController * loginVC = [[DKSLoginViewController alloc] init];
    //    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    //    [rootVC presentViewController:nav animated:NO completion:nil];
    
    //第二种方法
    DKSLoginViewController * loginVC = [[DKSLoginViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = nav;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end