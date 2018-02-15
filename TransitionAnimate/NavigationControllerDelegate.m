//
//  NavigationControllerDelegate.m
//  TransitionAnimate
//
//  Created by Chris Eidhof on 09.10.13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "PopAnimator.h"
#import "PushAnimator.h"
#import "CeshiViewController.h"

@interface NavigationControllerDelegate ()

@property (weak, nonatomic) IBOutlet UINavigationController *navigationController;
@property (strong, nonatomic) PopAnimator* popAnimator;
@property (strong, nonatomic) PushAnimator* pushAnimator;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;

@property (nonatomic, assign) BOOL isStart;
@property (nonatomic, assign) BOOL isPush;
@end

@implementation NavigationControllerDelegate

- (void)awakeFromNib
{
    [super awakeFromNib];
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.navigationController.view addGestureRecognizer:panRecognizer];
    
    self.popAnimator = [PopAnimator new];
    self.pushAnimator = [PushAnimator new];
}

- (void)pan:(UIPanGestureRecognizer*)recognizer
{
    UIView* view = self.navigationController.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.interactionController = [UIPercentDrivenInteractiveTransition new];
        self.isStart = YES;
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];
        if (self.isStart) {
            self.isPush = translation.x < 0;
            if (self.isPush) {
                CeshiViewController * ceshiVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"123123"];
                [self.navigationController pushViewController:ceshiVC animated:YES];
            }else{
                [self.navigationController popViewControllerAnimated:YES];
            }
            self.isStart = NO;
        }
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds))*1.5;
        [self.interactionController updateInteractiveTransition:d];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint translation = [recognizer translationInView:view];
        if (fabs(translation.x) >= CGRectGetWidth(view.bounds)/3) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        [self reset];
    }else if (recognizer.state == UIGestureRecognizerStateCancelled) {
        [self reset];
    }
}

- (void)reset {
    self.interactionController = nil;
    self.isStart = NO;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return self.popAnimator;
    }
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimator;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactionController;
}
@end

