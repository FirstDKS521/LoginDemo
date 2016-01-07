//
//  DKSRegisterViewController.h
//  Tabbar
//
//  Created by DuKaiShun on 15/12/29.
//  Copyright © 2015年 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TextBlock)(NSString *user, NSString *password);
@interface DKSRegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
/**
 *  点击注册按钮
 *
 *  @param sender 注册成功会自动返回
 */
- (IBAction)passwordButton:(id)sender;
/**
 *  验证按钮
 *  @param sender 输入完验证码，点击验证
 */
- (IBAction)codeButton:(UIButton *)sender;
/**
 *  发送验证码
 *  @param sender 输入完手机号码，点击发送按钮，会往手机上面发送一条短信，貌似只能往我自己的手机上发
 *  @param sender 可以不点击发送，直接输入密码，点击注册就可以了
 */
- (IBAction)sendButton:(UIButton *)sender;

@property (nonatomic, copy) TextBlock block;
- (void)setBlock:(TextBlock)block;

@end
