//
//  AppDelegate.m
//  BaseProject
//
//  Created by RongXing on 2018/11/5.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "AppDelegate.h"

#import "WelcomeViewController.h"
#import "MainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  ///去欢迎界面
//    WelcomeViewController * welcomeVc = [[WelcomeViewController alloc]init];
//
//    self.window.rootViewController = welcomeVc;
//
//    [self.window makeKeyAndVisible];
    
//    直接去主界面
    MainTabBarController *mainVc = [[MainTabBarController alloc]init];
    self.window.rootViewController = mainVc;
    
    [self.window makeKeyWindow];
    
    return YES;
}













@end
