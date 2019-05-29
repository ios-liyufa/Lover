//
//  LYFLoginViewController.m
//  Lover
//
//  Created by ios on 2018/3/29.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFLoginViewController.h"
#import "LYFVerifyViewController.h"

@interface LYFLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@end

@implementation LYFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.navigationItem.title = @"输入手机号";
}

- (IBAction)selectHeadNumber:(id)sender {
    [self.phoneNumberTextField resignFirstResponder];
}

- (IBAction)nextBtnAction:(id)sender {
    [self.phoneNumberTextField resignFirstResponder];
    
    LYFVerifyViewController *vc = [[LYFVerifyViewController alloc] initWithNibName:@"LYFVerifyViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:vc animated:YES];
    
    
//    [self.navigationController pushViewController:[[UINavigationController alloc] initWithRootViewController:vc]; animated:<#(BOOL)#>];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.phoneNumberTextField resignFirstResponder];
}

@end
