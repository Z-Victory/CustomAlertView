//
//  PBAlertControllerViewController.m
//  自定义提示框
//
//  Created by IOS on 16/10/28.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "PBAlertController.h"

/** 屏幕尺寸 */
#define kMainScreenBounds [UIScreen mainScreen].bounds

@interface PBAlertController ()

/** 蒙版 */
@property (nonatomic, strong) UIView *coverView;
/** 弹框 */
@property (nonatomic, strong) UIView *alertView;
/** 点击确定回调的block */
@property (nonatomic, copy) PBBlock block;

@end

@implementation PBAlertController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)alertViewControllerWithMessage:(NSString *)message andBlock:(PBBlock) block{
    
    self.block = block;
    //创建蒙版
    UIView * coverView = [[UIView alloc] initWithFrame:kMainScreenBounds];
    self.coverView = coverView;
    [self.view addSubview:coverView];
    coverView.backgroundColor =  self.coverBackgroundColor;
    coverView.alpha = 0.3;
    
    //创建提示框view
    UIView * alertView = [[UIView alloc] init];
    alertView.backgroundColor = self.alertBackgroundColor;
    //设置圆角半径
    alertView.layer.cornerRadius = 10.0f;
    self.alertView = alertView;
    [self.view addSubview:alertView];
    alertView.center = coverView.center;
    alertView.bounds = CGRectMake(0, 0, kMainScreenBounds.size.width * 0.84, 212);
    
    //图片
    UIImageView * disconnectionImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 92, 92)];
    disconnectionImg.image = [UIImage imageNamed:@"meiyouwangluo"];
    CGRect disImg = disconnectionImg.frame;
    disImg.origin.y = 13;
    disImg.origin.x = alertView.bounds.size.width/2 - 46;
    disconnectionImg.frame = disImg;
    [alertView addSubview:disconnectionImg];
    
    //无法连接到网络，请检查网络设置
    UILabel * alertContent2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 256, 19)];
    alertContent2.text = @"无法连接到网络，请检查网络设置";
    [alertContent2 setTextAlignment:NSTextAlignmentCenter];
    alertContent2.textColor = self.messageColor;
    alertContent2.font = [UIFont systemFontOfSize:16];
    CGRect alertContentPoint2 = alertContent2.frame;
    alertContentPoint2.origin.y = 127;
    alertContentPoint2.origin.x = alertView.bounds.size.width/2 - 128;
    alertContent2.frame = alertContentPoint2;
    [alertView addSubview:alertContent2];
    
    //分割线
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 168, alertView.bounds.size.width, 1)];
    lineView.backgroundColor = self.btnCancelBackgroundColor;
    [alertView addSubview:lineView];
    
    
    //确定按钮
    UIButton * cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 173, alertView.bounds.size.width, 35)];
    [cancelBtn setTitle:@"确定" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn setBackgroundColor:self.btnConfirmBackgroundColor];
    cancelBtn.layer.masksToBounds = YES;
    [cancelBtn addTarget:self action:@selector(didClickBtnConfirm:) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.tag = 0;
    [alertView addSubview:cancelBtn];
    
//    //创建操作提示 label
//    UILabel * label = [[UILabel alloc] init];
//    [alertView addSubview:label];
//    label.text = @"操作提示";
//    label.font = [UIFont systemFontOfSize:19];
//    label.textAlignment = NSTextAlignmentCenter;
//    CGFloat lblWidth = alertView.bounds.size.width;
//    CGFloat lblHigth = 22;
//    label.frame = CGRectMake(0, 0, lblWidth, lblHigth);
    
    //创建中间灰色分割线
//    UIView * separateLine = [[UIView alloc] init];
//    separateLine.backgroundColor = [UIColor grayColor];
//    [alertView addSubview:separateLine];
//    separateLine.frame = CGRectMake(0, lblHigth + 1, alertView.bounds.size.width, 1);
//    
//    //创建message label
//    UILabel * lblMessage = [[UILabel alloc] init];
//    lblMessage.textColor = self.messageColor;
//    [alertView addSubview:lblMessage];
//    lblMessage.text = message;
//    lblMessage.textAlignment = NSTextAlignmentCenter;
//    lblMessage.numberOfLines = 2; //最多显示两行Message
//    CGFloat margin = 5;
//    CGFloat msgX = margin;
//    CGFloat msgY = lblHigth + 3;
//    CGFloat msgW = alertView.bounds.size.width - 2 * margin;
//    CGFloat msgH = 44;
//    lblMessage.frame = CGRectMake(msgX, msgY, msgW, msgH);
//    
//    //创建确定 取消按钮
//    CGFloat buttonWidth = (alertView.bounds.size.width - 4 * margin) * 0.5;
//    CGFloat buttonHigth = 25;
//    UIButton * btnCancel = [[UIButton alloc] init];
//    [alertView addSubview:btnCancel];
//    [btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
//    [btnCancel setBackgroundColor:self.btnCancelBackgroundColor];
//    btnCancel.frame = CGRectMake(margin, alertView.bounds.size.height - margin - buttonHigth, buttonWidth, buttonHigth);
//    btnCancel.tag = 0;
//    [btnCancel addTarget:self action:@selector(didClickBtnConfirm:) forControlEvents:UIControlEventTouchUpInside];
//    //确定按钮
//    UIButton * btnConfirm = [[UIButton alloc] init];
//    btnConfirm.tag = 1;
//    [alertView addSubview:btnConfirm];
//    [btnConfirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnConfirm setTitle:@"确定" forState:UIControlStateNormal];
//    [btnConfirm setBackgroundColor:self.btnConfirmBackgroundColor];
//    btnConfirm.frame = CGRectMake(alertView.bounds.size.width - margin - buttonWidth, alertView.bounds.size.height - margin - buttonHigth, buttonWidth, buttonHigth);
//    [btnConfirm addTarget:self action:@selector(didClickBtnConfirm:) forControlEvents:UIControlEventTouchUpInside];
    
}

/** 点击确定 or 取消触发事件 */
-(void)didClickBtnConfirm:(UIButton *)sender{
    
    if (sender.tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    self.block();
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

static PBAlertController * instance = nil;
+(instancetype)shareAlertController{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PBAlertController alloc] init];
    });
    return instance;
}

-(UIColor *)alertBackgroundColor{
    
    if (_alertBackgroundColor == nil) {
        _alertBackgroundColor = [UIColor whiteColor];
    }
    return _alertBackgroundColor;
}

/** 确定按钮背景色 */
-(UIColor *)btnConfirmBackgroundColor{
    
    if (_btnConfirmBackgroundColor == nil) {
        _btnConfirmBackgroundColor = [UIColor clearColor];
    }
    return _btnConfirmBackgroundColor;
}

/** 取消按钮背景色 */
-(UIColor *)btnCancelBackgroundColor{
    
    if (_btnCancelBackgroundColor == nil) {
        _btnCancelBackgroundColor = [UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1];
    }
    return _btnCancelBackgroundColor;
}

/** message字体颜色 */
-(UIColor *)messageColor{
    
    if (_messageColor == nil) {
        _messageColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    }
    return _messageColor;
}
/** 蒙版颜色 */
-(UIColor *)coverBackgroundColor{
    
    if (_coverBackgroundColor == nil) {
        _coverBackgroundColor = [UIColor colorWithRed:13/255.0 green:12/255.0 blue:20/255.0 alpha:0.3];
    }
    return _coverBackgroundColor;
}
@end
