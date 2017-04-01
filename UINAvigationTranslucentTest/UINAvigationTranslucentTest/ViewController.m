//
//  ViewController.m
//  UINAvigationTranslucentTest
//
//  Created by Xue Yang on 2017/4/1.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+Translucent.h"
#import "UIViewController+translucent.h"
#import "NextViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"ViewController";
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    self.view.backgroundColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.alphaValue = 1;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NextViewController *vc = [NextViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
