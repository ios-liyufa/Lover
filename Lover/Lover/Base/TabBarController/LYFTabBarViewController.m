//
//  LYFTabBarViewController.m
//  Lover
//
//  Created by ios on 2018/3/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFTabBarViewController.h"

#import "LYFCenterTableViewController.h"
#import "LYFLiYuanYuanViewController.h"
#import "LYFWEViewController.h"

#import "LYFNavigationController.h"

@interface LYFTabBarViewController (){
    NSInteger _indexFlag;
}
@property (nonatomic ,strong) UIButton *btn;

@end

@implementation LYFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attrs[NSForegroundColorAttributeName] = LYFRGBColor(169, 169, 169, 1);
    
    NSMutableDictionary *attrs1 = [NSMutableDictionary dictionary];
    attrs1[NSFontAttributeName] = attrs[NSFontAttributeName];
    attrs1[NSForegroundColorAttributeName] = NAVIGATIONBAR_COLOR;
    [self.tabBar setBackgroundImage: [UIImage imageNamed:@""]];
    // 通过appearence设置tabBatItem的标题颜色,字体
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:attrs1 forState:UIControlStateSelected];
    
    // 添加子控制器
    // 我(首页)
    LYFCenterTableViewController *homeViewController = [[LYFCenterTableViewController alloc] init];
    
    [self addchildControllersWithViewController:homeViewController Title:@"我的" image:@"me" selectedImage:@"me_select"];
    
    // 你
    LYFLiYuanYuanViewController *forumViewController = [[LYFLiYuanYuanViewController alloc] init];
    [self addchildControllersWithViewController:forumViewController Title:@"你的" image:@"you" selectedImage:@"you_select"];
    
    // 我们
    LYFWEViewController *meViewController = [[LYFWEViewController alloc] initWithNibName:@"LYFWEViewController" bundle:[NSBundle mainBundle]];
    [self addchildControllersWithViewController:meViewController Title:@"我们" image:@"we" selectedImage:@"we_select"];
}


/**
 *  添加子控制器
 */
- (void)addchildControllersWithViewController:(UIViewController*)vc Title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    LYFNavigationController *nav =  [[LYFNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    if (_indexFlag != index) {
        [self animationWithIndex:index];
    }
    
}
// 动画
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    if (index==3) {///缩放
        //开始动画
        [UIView beginAnimations:@"doflip" context:nil];
        //设置时常
        [UIView setAnimationDuration:.75];
        //设置动画淡入淡出
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        //设置代理
        [UIView setAnimationDelegate:self];
        //设置翻转方向
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:tabbarbuttonArray[index] cache:YES];
        //动画结束
        [UIView commitAnimations];
    }else {///翻转动画
        
        CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pulse.duration = 0.08;
        pulse.repeatCount= 1;
        pulse.autoreverses= YES;
        pulse.fromValue= [NSNumber numberWithFloat:0.7];
        pulse.toValue= [NSNumber numberWithFloat:1.3];
        [[tabbarbuttonArray[index] layer] addAnimation:pulse forKey:nil];
    }
    
    _indexFlag = index;
    
}
@end
