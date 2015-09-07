//
//  ViewController.m
//  LLPartTimeJob
//
//  Created by Larry on 15/8/4.
//  Copyright (c) 2015年 Luolei. All rights reserved.
//

#import "LLRootViewController.h"
#import "AnimateTabbar.h"

@interface LLRootViewController ()<AnimateTabbarDelegate>

@end

@implementation LLRootViewController
#pragma mark lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    AnimateTabbarView *tabbar = [[AnimateTabbarView alloc] initWithFrame:(CGRect){0, kScreenHeight - kTabbarHeight, kScreenWidth, kTabbarHeight}];
    tabbar.delegate = self;
    [self.view addSubview:tabbar];
}

#pragma mark AnimateTabbarDelegate

-(void)FirstBtnClick {
    
}
-(void)SecondBtnClick {
    
}
-(void)ThirdBtnClick {
    
}
-(void)FourthBtnClick {
    
}

@end
