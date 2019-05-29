//
//  LYFCenterTableViewController.m
//  Lover
//
//  Created by ios on 2018/3/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFCenterTableViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"

@interface LYFCenterTableViewController ()

@end

@implementation LYFCenterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的"];
    self.view.backgroundColor = [UIColor cyanColor];
    [self setupRightMenuButton];
}

-(void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

@end
