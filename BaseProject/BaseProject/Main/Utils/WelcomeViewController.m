//
//  WelcomeViewController.m
//  BaseProject
//
//  Created by RongXing on 2018/11/6.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "WelcomeViewController.h"




@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BOOL t = ISIOS(8.0) ;
    
    NSLog(@"%@",t?@"YES":@"NO");
}

/**
 *初始化界面
 */
-(void)initView{
    if(DEVICE_IS_IPHONE35){
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default35"]];
    }else if(DEVICE_IS_IPHONE5){
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default40"]];
    }else if(DEVICE_IS_IPHONE47){
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default47"]];
    }else if(DEVICE_IS_IPHONE55){
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default55"]];
    }else {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default35"]];
    }
}


-(void)viewDidAppear:(BOOL)animated{
    [self gotoMainView];
    
/*********此处判断是否已经登陆************/
    
//    if(isLoginUser){
//        //已经登陆，跳转到主界面中
//        [self gotoMainView];
//    }else{
//        //没有登陆 自动登录
//        [self initUserLogin];
//    }
//    
}


/**
 *前往主界面
 */
-(void)gotoMainView{
    
    
}


/**
 *实现用户自动登录功能
 */
-(void)initUserLogin{
    //此处判断是否允许自动登陆
    BOOL isAutoLogin = YES;  //去取用户的选择
    if (isAutoLogin) {
        //此处判断是否已经登陆过
        BOOL havedLogin = YES ;  //通过去取沙盒中特定字段，判断是否有值来断定是否已经登陆过
        if (havedLogin) {
            //已经登陆过，去取沙盒中对应的用户账号与密码登陆
            [self longin];
        }else{
            [self gotoUserLoginView];
        }
        
    }else{
        [self gotoUserLoginView];
    }
    
    
}

/**
 *前往登录界面
 */
-(void)gotoUserLoginView{
    
    
}

/**
 *  登陆
 */
-(void)longin {
    //此处直接登陆操作
    NSLog(@"登陆请求未实现");
    
    //登陆完成后直接去主界面
    
    [self gotoMainView];
    
}



@end
