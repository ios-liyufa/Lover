//
//  LYFLaunchPageViewController.h
//  Lover
//
//  Created by ios on 2018/3/27.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFBaseViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LYFLaunchPageViewController : LYFBaseViewController

/** 进入首页按钮 */
@property (nonatomic,weak) UIButton *enterButton;

/** 创建普通滚动图片新特性界面
 *  @param imageNames 图片名数组
 *  @param enterBlock 进入主页面的回调
 *  @param configurationBlock 配置回调
 */
+ (instancetype)newFeatureVCWithImageNames:(NSArray *)imageNames enterBlock:(void(^)())enterBlock configuration:(void (^)(UIButton *enterButton))configurationBlock;


/** 创建视频新特性界面
 *  @param URL 视频路径
 *  @param enterBlock 进入主页面的回调
 *  @param configurationBlock 配置回调
 */
+ (instancetype)newFeatureVCWithPlayerURL:(NSURL *)URL enterBlock:(void(^)())enterBlock configuration:(void (^)(AVPlayerLayer *playerLayer))configurationBlock;

/*
 *  是否应该显示版本新特性界面
 */
+ (BOOL)canShowNewFeature;

@end
