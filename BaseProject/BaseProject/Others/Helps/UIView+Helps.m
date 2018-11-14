//
//  UIView+Helps.m
//  BaseProject
//
//  Created by RongXing on 2018/11/6.
//  Copyright © 2018年 Quanling_Xia. All rights reserved.
//

#import "UIView+Helps.h"

@implementation UIView (Helps)
//RGB颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]






/**
 *生成NavBar标题
 */

+(UILabel *)createNavItemTitleView:(NSString *)title withFrame:(CGRect) frame{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    titleLabel.text = title;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    titleLabel.textColor = RGBCOLOR(255, 255, 255);
    return titleLabel;
}
/**
 *生成NavBar返回按钮
 */
+(UIBarButtonItem *)createNavBarBackItem:(id)target action:(SEL)action{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 7, 30, 30);
    //[backButton setBackgroundImage:[[UIImage imageNamed:@"NaviBtn_Back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"NaviBtn_Back"] forState:UIControlStateNormal];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return backItem;
}

/**
 *生成NavBar map按钮
 */
+(UIBarButtonItem *)createNavBarMapItem:(id)target action:(SEL)action{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 40, 40);
    [backButton setBackgroundImage:[UIImage imageNamed:@"nav_map"] forState:UIControlStateNormal];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return backItem;
}
/**
 *生成带点标题
 */
+(UIView *)createPointTitle:(NSString *)title withFrame:(CGRect) frame{
    UIView *titleView = [[UIView alloc] initWithFrame:frame];
    titleView.backgroundColor= [UIColor clearColor];
    
    UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(0,(frame.size.height-10)/2,10,10)];
    pointView.layer.cornerRadius = 5.0f;
    pointView.backgroundColor = RGBCOLOR(37, 37, 37);
    pointView.clipsToBounds = YES;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,0,frame.size.width-15,frame.size.height)];
    titleLabel.text = title;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:14.0f];
    titleLabel.textColor = RGBCOLOR(37, 37, 37);
    
    [titleView addSubview:pointView];
    [titleView addSubview:titleLabel];
    return titleView;
}
@end
