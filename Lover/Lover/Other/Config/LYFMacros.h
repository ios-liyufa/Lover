
//
//  LYFMacros.h
//  Lover
//
//  Created by ios on 2018/3/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#ifndef LYFMacros_h
#define LYFMacros_h

/*
 *NSLog打印宏
 */
#ifdef DEBUG
#define LYFSLog(...)   NSLog(__VA_ARGS__)
#else
#define LYFLog(...)
#endif

/**
 * 屏幕物理尺寸
 */
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

/*
 *颜色
 */
#define LYFRGBColor(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define NAVIGATIONBAR_COLOR LYFRGBColor(136, 139, 238, 1)

#define LYFUserDefault [NSUserDefaults standardUserDefaults]

#endif /* LYFMacros_h */
