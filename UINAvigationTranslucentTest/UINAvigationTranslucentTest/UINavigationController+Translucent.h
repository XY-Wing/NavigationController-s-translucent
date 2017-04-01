//
//  UINavigationController+Translucent.h
//  UINAvigationTranslucentTest
//
//  Created by Xue Yang on 2017/4/1.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Translucent)<UINavigationBarDelegate, UINavigationControllerDelegate>
- (void)setNeedsNavigationBackground:(CGFloat)alpha;
@end
