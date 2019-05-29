//
//  AppDelegate.m
//  Lover
//
//  Created by ios on 2018/1/15.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "AppDelegate.h"
#import "LYFLaunchPageViewController.h"
#import "CALayer+Transition.h"
#import "LYFTabBarViewController.h"

@interface AppDelegate ()

@end
@implementation AppDelegate

#pragma mark-获取appdelegate
+ (AppDelegate* )shareAppDelegate{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self setupRootVC];
    
   
    
    return YES;
}
#pragma mark-设置根控制器
-(void)setupRootVC{
    //判断是否需要显示：（内部已经考虑版本及本地版本缓存）
    BOOL canShow = [LYFLaunchPageViewController canShowNewFeature];
    //测试代码，正式版本应该删除
    canShow = NO;
    if(canShow){ // 初始化新特性界面
        
        NSString *str = [[NSBundle mainBundle] resourcePath];
        NSString *filePath = [NSString stringWithFormat:@"%@%@",str,@"/video.mp4"];
        
        NSLog(@"%@",filePath);
        
        NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
        
        self.window.rootViewController = [LYFLaunchPageViewController newFeatureVCWithPlayerURL:sourceMovieURL enterBlock:^{
            NSLog(@"进入主页面");
            [self enter];
        } configuration:^(AVPlayerLayer *playerLayer) {

        }];
    }else{
        [self enter];
    }
}

// 进入主页面

-(void)enter{
    
    LYFTabBarViewController *vc = [[LYFTabBarViewController alloc] init];
    self.window.rootViewController = vc;
    
    [self.window.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1.5f];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
