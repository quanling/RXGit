//
//  TSViewController.m
//  BaseProject
//
//  Created by RongXing on 2018/11/10.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "TSViewController.h"

@interface TSViewController ()

@end

@implementation TSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark 刷新
-(void)headerRefresh
{
    NSLog(@"子类实现的headerRefresh");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
    
}

-(void)footerRefresh
{
    NSLog(@"子类实现的footerRefresh");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    });
}
@end
