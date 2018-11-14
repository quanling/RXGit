//
//  UIView+Helps.h
//  BaseProject
//
//  Created by RongXing on 2018/11/6.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Helps)



#pragma mark NavigationBar 专用View扩展方法
/**
 *生成NavBar标题
 */
+(UILabel *)createNavItemTitleView:(NSString *)title withFrame:(CGRect) frame;

/**
 *生成NavBar返回按钮
 */
+(UIBarButtonItem *)createNavBarBackItem:(id)target action:(SEL)action;
/**
 *生成NavBar map按钮
 */
+(UIBarButtonItem *)createNavBarMapItem:(id)target action:(SEL)action;
/**
 *生成带点标题
 */
+(UIView *)createPointTitle:(NSString *)title withFrame:(CGRect) frame;


@end
