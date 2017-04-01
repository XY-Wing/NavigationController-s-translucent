//
//  UINavigationController+Translucent.m
//  UINAvigationTranslucentTest
//
//  Created by Xue Yang on 2017/4/1.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "UINavigationController+Translucent.h"
#import "UIViewController+translucent.h"
#import <objc/runtime.h>
@implementation UINavigationController (Translucent)
+ (void)initialize
{
    if (self == [UINavigationController self]) {
        SEL systemSEL = NSSelectorFromString(@"_updateInteractiveTransition:");
        SEL swizzleSEL = NSSelectorFromString(@"xy_updateInteractiveTransition:");
        Method systemMethod = class_getInstanceMethod([self class], systemSEL);
        Method swizzleMethod = class_getInstanceMethod([self class], swizzleSEL);
        method_exchangeImplementations(systemMethod, swizzleMethod);
    }
    
}
- (void)xy_updateInteractiveTransition:(CGFloat)percent
{
    [self xy_updateInteractiveTransition:percent];
    UIViewController *topVC = self.topViewController;
    if (topVC != nil) {
        id<UIViewControllerTransitionCoordinator> coor = topVC.transitionCoordinator;
        if (coor != nil) {
            // 随着滑动的过程设置导航栏透明度渐变
            CGFloat fromAlpha = [coor viewControllerForKey:UITransitionContextFromViewControllerKey].alphaValue;
            CGFloat toAlpha = [coor viewControllerForKey:UITransitionContextToViewControllerKey].alphaValue;
            CGFloat nowAlpha = fromAlpha + (toAlpha - fromAlpha) * percent;
            [self setNeedsNavigationBackground:nowAlpha];
        }
    }
}
- (void)setNeedsNavigationBackground:(CGFloat)alpha
{
    // 导航栏背景透明度设置
    UIView *barBackgroundView = [[self.navigationBar subviews] objectAtIndex:0];// _UIBarBackground
    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
    if (self.navigationBar.isTranslucent) {
        if (backgroundImageView != nil && backgroundImageView.image != nil) {
            barBackgroundView.alpha = alpha;
        } else {
            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
    } else {
        barBackgroundView.alpha = alpha;
    }
    
    self.navigationBar.clipsToBounds = alpha == 0.0;
}

@end
