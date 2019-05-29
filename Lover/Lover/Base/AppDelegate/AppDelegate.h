//
//  AppDelegate.h
//  Lover
//
//  Created by ios on 2018/1/15.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) MMDrawerController * drawerController;
+ (AppDelegate* )shareAppDelegate;
@end

