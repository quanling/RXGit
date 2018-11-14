//
//  QLBaseTableViewController.m
//  BaseProject
//
//  Created by RongXing on 2018/11/10.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "QLBaseTableViewController.h"


@interface QLBaseTableViewController ()



@end



@implementation QLBaseTableViewController

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self.view addSubview:self.tableView];
    
}

-(void)initData
{
    self.currentPage = 0;
    self.totalPage = 0;
}


#pragma mark delegate 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld -- tableViewCell",indexPath.row];
    
    return cell;
    
}


#pragma mark 刷新
-(void)headerRefresh
{
    NSLog(@"父类实现的headerRefresh");
}

-(void)footerRefresh
{
    NSLog(@"父类实现的footerRefresh");
}



@end
