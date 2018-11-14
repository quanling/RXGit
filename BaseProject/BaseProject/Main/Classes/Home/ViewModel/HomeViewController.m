//
//  HomeViewController.m
//  BaseProject
//
//  Created by RongXing on 2018/11/10.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "HomeViewController.h"
#import "TSViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configUI];
    [self prepareData];
}


-(void)configUI
{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}



-(void)prepareData
{
    
}

-(void)btnClick
{
    [self.navigationController pushViewController:[TSViewController new] animated:YES];
}


@end
