//
//  NextViewController.m
//  UINAvigationTranslucentTest
//
//  Created by Xue Yang on 2017/4/1.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "NextViewController.h"
#import "UIViewController+translucent.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"NextViewController";
    
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    self.view.backgroundColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.alphaValue = 0;
}
@end
