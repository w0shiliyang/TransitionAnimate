//
//  PushAnimator.h
//  TransitionAnimate
//
//  Created by 李洋 on 2018/1/24.
//  Copyright © 2018年 Chris Eidhof. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationControllerDelegate.h"

@interface PushAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (weak,   nonatomic) UINavigationController *naviController;

@end


