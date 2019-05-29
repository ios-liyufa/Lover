//
//  LYFVerifyViewController.m
//  Lover
//
//  Created by ios on 2018/3/30.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFVerifyViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "LYFCenterTableViewController.h"
#import "LYFRightSideDrawerViewController.h"
#import "LYFTabBarViewController.h"
//侧滑动画
#import "MMExampleDrawerVisualStateManager.h"
#import "AppDelegate.h"

@interface LYFVerifyViewController ()

@property (weak, nonatomic) IBOutlet UIView *codeBgView;
@property (weak, nonatomic) IBOutlet UIView *accountBgView;

/**
 根据查询的状态来进行改变按钮文字;
 */
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;

@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation LYFVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"验证与登录";
    
    self.codeBgView.layer.cornerRadius = 5;
    self.accountBgView.layer.cornerRadius = 5;
    self.nextBtn.layer.cornerRadius = 5;
    
    self.codeBgView.layer.masksToBounds = YES;
    self.accountBgView.layer.masksToBounds = YES;
    self.nextBtn.layer.masksToBounds = YES;
}

/**
 注册并登录或登录

 @param sender sender description
 */
- (IBAction)nextBtnAction:(id)sender {
    [self.codeTextField resignFirstResponder];
    [self.accountTextField resignFirstResponder];
    //初始化中间控制器
    LYFTabBarViewController *centerViewController = [[LYFTabBarViewController alloc] init];

    //初始化右边边抽屉
    UIViewController *rightSideDrawerViewController = [[LYFRightSideDrawerViewController alloc] init];
    //如果不需要导航可不写
    UINavigationController *rightSideNavController = [[LYFNavigationController alloc] initWithRootViewController:rightSideDrawerViewController];  
    
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:centerViewController rightDrawerViewController:rightSideNavController];
    self.drawerController.view.backgroundColor = [UIColor whiteColor];
    [self.drawerController setShowsShadow:NO];
    [self.drawerController setRestorationIdentifier:@"LYFDrawer"];
    
    [self.drawerController setMaximumRightDrawerWidth:SCREEN_WIDTH-(SCREEN_WIDTH/4)];//拉开的宽度
    
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    [[AppDelegate shareAppDelegate].window setRootViewController:self.drawerController];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.codeTextField resignFirstResponder];
    [self.accountTextField resignFirstResponder];
}


@end
