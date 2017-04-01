//
//  UIViewController+translucent.m
//  UINAvigationTranslucentTest
//
//  Created by Xue Yang on 2017/4/1.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "UIViewController+translucent.h"
#import <objc/runtime.h>
#import "UINavigationController+Translucent.h"
static char * kXYCatagoryAlphaValueName = "kXYCatagoryAlphaValueName";
@implementation UIViewController (translucent)


- (void)setAlphaValue:(CGFloat)alphaValue
{
    NSString *alphaStr = [NSString stringWithFormat:@"%f",alphaValue];
    objc_setAssociatedObject(self, kXYCatagoryAlphaValueName, alphaStr, OBJC_ASSOCIATION_ASSIGN);
    
    [self.navigationController setNeedsNavigationBackground:alphaValue];
}
- (CGFloat)alphaValue
{
    NSString *alphaStr = objc_getAssociatedObject(self, kXYCatagoryAlphaValueName);
    return alphaStr.floatValue;
}
@end
