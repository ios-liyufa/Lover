//
//  LYFTableViewController.m
//  Lover
//
//  Created by ios on 2018/3/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "LYFTableViewController.h"

@interface LYFTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LYFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 懒加载tableView
 @return tableView
 */
- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height) style:UITableViewStyleGrouped];
        //如不设置，默认系统
//        self.tableView.backgroundColor = kViewBackgroundColor ;
//        self.tableView.separatorColor = kLienColor;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        /**
         给tableViwe的空白添加手势
         */
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
        [self.tableView addGestureRecognizer:tapGesture];
        tapGesture.cancelsTouchesInView =NO;
        
        [self tableArray];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

/**
 点击tableViwe空白的方法
 */
-(void)dismissKeyBoard{
    [self.view endEditing:NO];
    [self.tableView endEditing:NO];
}

- (NSMutableArray *)tableArray {
    if (!_tableArray) {
        _tableArray = [[NSMutableArray alloc]init];
    }
    return _tableArray;
}

#pragma mark tabelView的代理方法;子类实现
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc]init];
}


@end
