//
//  UIView+LYFExtention.h
//  Lover
//
//  Created by ios on 2018/3/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LYFExtention)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

/**
 寻找当前view所在的主视图控制器
 
 @return 返回当前主视图控制器
 */
- (UIViewController *)viewController;

@end
