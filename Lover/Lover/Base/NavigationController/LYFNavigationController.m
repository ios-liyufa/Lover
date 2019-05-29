//
//  LYFNavigationController.m
//  Lover
//
//  Created by ios on 2018/3/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFNavigationController.h"
#import "UIViewController+MMDrawerController.h"
#import "LYFBackButton.h"

@interface LYFNavigationController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong)LYFBackButton *backBtn;

@end

@implementation LYFNavigationController

/**
 *  第一次使用该类时调用
 */
+ (void)initialize
{
    
    // 通过appearence设置导航栏全局色
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [navBar setBarTintColor:NAVIGATIONBAR_COLOR];
    
    //标题色
    NSDictionary *titleAttrs = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]};
    [navBar setTitleTextAttributes:titleAttrs];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  清空代理,默认用户的手势就是有效的
     */
    //    self.interactivePopGestureRecognizer.delegate = nil;
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.barTintColor = NAVIGATIONBAR_COLOR;
    
    [self.backBtn setTitle:@"" forState:UIControlStateNormal];
    
    self.navigationController.navigationBar.topItem.title = @"";
    self.navigationController.navigationBar.tintColor = LYFRGBColor(228, 221, 198,1);
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:LYFRGBColor(228, 221, 198,1), NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    if (@available(iOS 11.0, *)){
        
        [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back"];
        [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"back"];
    }else{
        //    自定义返回按钮  (全局设置)
        UIImage *backButtonImage = [[UIImage imageNamed:@"back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //    将返回按钮的文字position设置不在屏幕上显示
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    if(self.mm_drawerController.showsStatusBarBackgroundView){
        return UIStatusBarStyleLightContent;
    }
    else {
        return UIStatusBarStyleDefault;
    }
}


- (void)setBackTitle:(NSString *)title {
    [_backBtn setTitle:title forState:UIControlStateNormal];
    _backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
    CGSize size = [title sizeWithAttributes:attrs];
    _backBtn.size = CGSizeMake(_backBtn.size.width + size.width + 10, _backBtn.size.height);
}


/**
 * 可以拦截所有push进来的内容
 *
 *  @param viewController push进的VC
 *  @param animated       是否有动画效果
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        // 设置返回键
        _backBtn = [LYFBackButton buttonWithBackImage:@"back"];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_backBtn];
        
        // 隐藏底部标签
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    if ([viewControllerToPresent isKindOfClass:[LYFNavigationController class]]) {
        LYFNavigationController *nav = (LYFNavigationController *)viewControllerToPresent;
        UIViewController *root = nav.childViewControllers[0];
        LYFBackButton *backBtn = [LYFBackButton buttonWithBackImage:@"back"];
        root.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        [backBtn addTarget:self action:@selector(dismissModal) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [super presentViewController:viewControllerToPresent animated:YES completion:completion];
    
}

- (void)dismissModal{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //档子控制器个数大于1是,手势有效
    return self.childViewControllers.count > 1;
    
}

@end
