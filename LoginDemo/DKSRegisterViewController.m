//
//  DKSRegisterViewController.m
//  Tabbar
//
//  Created by DuKaiShun on 15/12/29.
//  Copyright © 2015年 aDu. All rights reserved.
//

#import "DKSRegisterViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/SMSSDK+AddressBookMethods.h>
#import <MOBFoundation/MOBFoundation.h>

@interface DKSRegisterViewController ()

@end

@implementation DKSRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *点击注册按钮
 */
- (IBAction)passwordButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    button.userInteractionEnabled = NO;
    BOOL isPhone = [self validateMobile:self.userField.text];
    if (isPhone) {
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        NSDictionary * dic = @{@"user":self.userField.text, @"password":self.passwordField.text};
        [user setObject:dic forKey:@"login"];
    }
    if (_block) {
        _block(self.userField.text, self.passwordField.text);
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}

/**
 *点击发送按钮
 */
- (IBAction)sendButton:(UIButton *)sender {
    if ([self validateMobile:self.userField.text]) {
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.userField.text zone:@"86" customIdentifier:nil result:^(NSError *error){
            if (!error) {
                //发送验证码成功的回调；
            } else {
                //发送验证码失败的回调；如果你输入错误的手机号码或者任意数字，就会回调；
            }
        }];
    }
}

/**
 *验证码验证
 */
- (IBAction)codeButton:(UIButton *)sender {
    [SMSSDK commitVerificationCode:self.codeField.text phoneNumber:self.userField.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            //验证成功后的回调；
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证信息" message:@"验证成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击取消");
            }];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击确定");
            }];
            [alert addAction:cancel];
            [alert addAction:sure];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            //验证失败后的回调；
            NSLog(@"验证失败");
        }
    }];
}

- (void)setBlock:(TextBlock)block
{
    if (_block != block) {
        _block = block;
    }
}

//手机号码验证
- (BOOL)validateMobile:(NSString *)mobile
{
    if (mobile.length != 11) {
        return NO;
    }
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

- (void)registerMethod
{
    [SMSSDK registerApp:@"e4231f9d405c"
             withSecret:@"f4d548f5a85b0762931cac5403be64d6"];
    
    //    [SMSSDK enableAppContactFriends:NO];
    
    [[MOBFDataService sharedInstance] setCacheData:@"e4231f9d405c" forKey:@"e4231f9d405c" domain:nil];
    [[MOBFDataService sharedInstance] setCacheData:@"f4d548f5a85b0762931cac5403be64d6" forKey:@"f4d548f5a85b0762931cac5403be64d6" domain:nil];
}

@end
