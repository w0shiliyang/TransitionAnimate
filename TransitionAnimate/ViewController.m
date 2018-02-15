//
//  ViewController.m
//  TransitionAnimate
//
//  Created by 李洋 on 2018/2/15.
//  Copyright © 2018年 李洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self.view isEqual:self.navigationController.view]) {
        NSLog(@"YES");
    }else{
        NSLog(@"NO");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
