//
//  QLBaseTableViewController.h
//  BaseProject
//
//  Created by RongXing on 2018/11/10.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "QLBaseViewController.h"
#import "MJRefresh.h"
@interface QLBaseTableViewController : QLBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,copy) NSMutableArray *dataArray;
@property (nonatomic ,assign) NSInteger *currentPage;
@property (nonatomic ,assign) NSInteger *totalPage;

@end
