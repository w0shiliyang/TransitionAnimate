//
//  Animator.h
//  TransitionAnimate
//
//  Created by Chris Eidhof on 9/27/13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationControllerDelegate.h"

@interface PopAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (weak,   nonatomic) UINavigationController *naviController;

@end
