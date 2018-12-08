//
//  ViewController.m
//  JSSelectDemo
//
//  Created by yj on 2018/12/8.
//  Copyright © 2018年 zjs.com. All rights reserved.
//

#import "ViewController.h"
#import "JSSelectViewController.h"
#import "Demo1VC.h"
#import "Demo2VC.h"
#import "Demo3VC.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
}


- (void)demo1{
    
    JSSelectViewController *selectVC = [[JSSelectViewController alloc] init];
    selectVC.selectViewFrame = CGRectMake(0, 0, 240, 30);
    selectVC.titleArr = @[@"自选",@"全球外汇",@"国际期货"];
    selectVC.controllerArr = @[[[Demo1VC alloc] init],[[Demo2VC alloc] init],[[Demo3VC alloc] init]];
    selectVC.selectIndex = 1;
    [self.navigationController pushViewController:selectVC animated:YES];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self demo1];
}

@end
