//
//  LYFBackButton.m
//  Lover
//
//  Created by ios on 2018/3/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFBackButton.h"

@implementation LYFBackButton

+ (instancetype)buttonWithBackImage:(NSString *)backImage{
    
    UIImage *backImg = [UIImage imageNamed:backImage];
    LYFBackButton *button = [LYFBackButton buttonWithType:UIButtonTypeCustom];
    [button setImage:backImg forState:UIControlStateNormal];
    [button setImage:backImg forState:UIControlStateHighlighted];
    button.size = CGSizeMake(60, 32);
    // 设置按钮的内边距
    //button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    // 让按钮内部的内容左对齐
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    return button;
}

@end
