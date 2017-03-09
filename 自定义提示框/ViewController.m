//
//  ViewController.m
//  自定义提示框
//
//  Created by IOS on 16/10/28.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "PBAlertController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//点击按钮弹出提示框
- (IBAction)clickShowAlertBtn:(id)sender {
    
    PBAlertController * alertVc = [PBAlertController shareAlertController];
    alertVc.messageColor = [UIColor redColor];
    [alertVc alertViewControllerWithMessage:@"这是一message沙哈" andBlock:^{
        NSLog(@"点击确定后执行的方法");
    }];
    alertVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:alertVc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
