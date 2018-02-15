//
//  PushAnimator.m
//  TransitionAnimate
//
//  Created by 李洋 on 2018/1/24.
//  Copyright © 2018年 Chris Eidhof. All rights reserved.
//

#import "PushAnimator.h"

@implementation PushAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:fromViewController.view];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    toViewController.view.transform = CGAffineTransformMakeTranslation(screenWidth, 0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeTranslation(-screenWidth/3, 0);
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        toViewController.view.transform = CGAffineTransformIdentity;
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
