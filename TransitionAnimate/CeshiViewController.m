//
//  CeshiViewController.m
//  TransitionAnimate
//
//  Created by 李洋 on 2017/12/21.
//  Copyright © 2017年 Chris Eidhof. All rights reserved.
//

#import "CeshiViewController.h"

@interface CeshiViewController ()

@end

@implementation CeshiViewController

- (void)viewDidLoad {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
