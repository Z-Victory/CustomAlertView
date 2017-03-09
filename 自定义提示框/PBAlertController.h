//
//  PBAlertControllerViewController.h
//  自定义提示框
//
//  Created by IOS on 16/10/28.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PBBlock)();
@interface PBAlertController : UIViewController
/** 设置alertView背景色 */
@property (nonatomic, copy) UIColor *alertBackgroundColor;
/** 设置确定按钮背景色 */
@property (nonatomic, copy) UIColor *btnConfirmBackgroundColor;
/** 设置取消按钮背景色 */
@property (nonatomic, copy) UIColor *btnCancelBackgroundColor;
/** 设置message字体颜色 */
@property (nonatomic, copy) UIColor *messageColor;
/** 设置蒙版颜色 */
@property (nonatomic, copy) UIColor *coverBackgroundColor;

/** 创建单例 */
+(instancetype)shareAlertController;
/** 弹出alertView以及点击确定回调的block */
-(void)alertViewControllerWithMessage:(NSString *)message andBlock:(PBBlock) block;

@end
