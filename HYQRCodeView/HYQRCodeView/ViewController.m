//
//  ViewController.m
//  HYQRCodeView
//
//  Created by wuhaoyuan on 2016/10/10.
//  Copyright © 2016年 HYQRCodeView. All rights reserved.
//

#import "ViewController.h"
#import "HYQRViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100,100, 100, 100);
    [button setTitle:@"点击扫码" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(qrView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.width, 50)];
    self.label.numberOfLines = 0;
    self.label.textColor = [UIColor blackColor];
    [self.view addSubview:self.label];
    
}

- (void)qrView{
    HYQRViewController *qrView = [[HYQRViewController alloc] init];
    qrView.block = ^(NSString *text) {
        self.label.text = text;
    };
    [self.navigationController pushViewController:qrView animated:YES];
//    [self presentViewController:qrView animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
