//
//  AppDelegate+DSSideDrawer.m
//  DaShi
//
//  Created by ios on 2018/3/26.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "AppDelegate+DSSideDrawer.h"
#import "MMDrawerVisualState.h"
#import "LYFCenterTableViewController.h"
#import "LYFRightSideDrawerViewController.h"
#import "LYFTabBarViewController.h"
//侧滑动画
#import "MMExampleDrawerVisualStateManager.h"

@implementation AppDelegate (DSSideDrawer)

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化中间控制器
    LYFTabBarViewController *centerViewController = [[LYFTabBarViewController alloc] init];
    //设置Identifier
    [centerViewController setRestorationIdentifier:@"LYFCenterTableViewControllerRestorationKey"];
    
    
    //初始化右边边抽屉
    UIViewController *rightSideDrawerViewController = [[LYFRightSideDrawerViewController alloc] init];
    //如果不需要导航可不写
    UINavigationController *rightSideNavController = [[LYFNavigationController alloc] initWithRootViewController:rightSideDrawerViewController];
    
    [rightSideNavController setRestorationIdentifier:@"LYFRightNavSideDrawerViewControllerRestorationKey"];
    
    
    
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
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                          green:173.0/255.0
                                           blue:234.0/255.0
                                          alpha:1.0];
    [self.window setTintColor:tintColor];
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder{
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder{
    return YES;
}

- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder{
    NSString * key = [identifierComponents lastObject];
    /** window */
    if([key isEqualToString:@"DSDrawer"]){
        return self.window.rootViewController;
    }
    /** 中间控制器 */
    else if ([key isEqualToString:@"LYFCenterTableViewControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).centerViewController;
    }
    
    /** 右边抽屉 */
    else if ([key isEqualToString:@"LYFRightNavSideDrawerViewControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).rightDrawerViewController;
    }
    else if ([key isEqualToString:@"DSRightSideDrawerViewController"]){
        UIViewController * rightVC = ((MMDrawerController *)self.window.rootViewController).rightDrawerViewController;
        if([rightVC isKindOfClass:[UINavigationController class]]){
            return [(UINavigationController*)rightVC topViewController];
        }
        else {
            return rightVC;
        }
    }
    
    /** 左边暂时不做处理 */
    else if ([key isEqualToString:@"MMExampleLeftNavigationControllerRestorationKey"]) {//暂时不作处理
        return ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;
    }
    else if ([key isEqualToString:@"MMExampleLeftSideDrawerController"]){//左边暂时不做处理
        UIViewController * leftVC = ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;
        if([leftVC isKindOfClass:[UINavigationController class]]){
            return [(UINavigationController*)leftVC topViewController];
        }
        else {
            return leftVC;
        }
    }
    return nil;
}

@end
