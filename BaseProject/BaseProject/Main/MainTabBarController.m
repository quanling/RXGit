//
//  MainTabBarController.m
//  BaseProject
//
//  Created by RongXing on 2018/11/9.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "MainTabBarController.h"



#define DEFAULTCOLOR [UIColor lightGrayColor]
#define SELECTCOLOR [UIColor redColor]

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildView];
//    [UIColor lightGrayColor]
    [self changeTitleColor];
}


///改变tabBarItem的title颜色
-(void)changeTitleColor
{
    //默认状态为：非选中状态为 灰色。   选中状态为 蓝色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:DEFAULTCOLOR} forState:UIControlStateNormal];      //非选中状态
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:SELECTCOLOR} forState:UIControlStateSelected];    //选中状态
    
    /*************此处设置tabBar颜色******************/
//    self.tabBar.barTintColor = [UIColor purpleColor];
    
}



-(void)addChildView
{
    [self addChildView:@"HomeViewController" withName:@"首页" withDefaultImageName:@"home-icon-unchecked" withSelectImageName:@"home-icon-selected"];
    [self addChildView:@"DetailViewController" withName:@"详情" withDefaultImageName:@"order-icon-Unchecked" withSelectImageName:@"order-icon-selected"];
    [self addChildView:@"DiscoverViewController" withName:@"发现" withDefaultImageName:@"shopping-cart-icon-unchecked" withSelectImageName:@"shopping-cart-icon-selected"];
    [self addChildView:@"MineViewController" withName:@"我的" withDefaultImageName:@"my-icon-Unchecked" withSelectImageName:@"my-icon-selected"];
    
    self.selectedIndex = 0;
    
}



-(void)addChildView:(NSString *)classView withName:(NSString *)name withDefaultImageName:(NSString *)imageName withSelectImageName:(NSString *)selectImageName
{
    UIViewController *vc = [[NSClassFromString(classView) alloc]init];
    vc.title = name;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    /*************此处设置导航栏颜色******************/
//    nav.navigationBar.barTintColor = [UIColor redColor];
//    nav.navigationBar.barStyle = UIBarStyleDefault;
    
    [self addChildViewController:nav];
    
}




@end
