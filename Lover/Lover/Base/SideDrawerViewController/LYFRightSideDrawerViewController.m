//
//  LYFRightSideDrawerViewController.m
//  Lover
//
//  Created by ios on 2018/3/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFRightSideDrawerViewController.h"

@interface LYFRightSideDrawerViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LYFRightSideDrawerViewController

-(id)init{
    self = [super init];
    if(self){
        [self setRestorationIdentifier:@"LYFRightSideDrawerViewController"];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"Right will appear");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"Right did appear");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"Right will disappear");
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"Right did disappear");
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"右边抽屉"];
    self.view.backgroundColor = [UIColor purpleColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

@end
