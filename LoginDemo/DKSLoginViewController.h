//
//  DKSLoginViewController.h
//  Tabbar
//
//  Created by DuKaiShun on 15/12/29.
//  Copyright © 2015年 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKSLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)loginButton:(id)sender;
- (IBAction)registerButton:(id)sender;

@end
