//  AppDelegate.h
//  AnimatTabbarSample
//
//  Created by chenyanming on 14-4-9.
//  Copyright (c) 2014年 chenyanming. All rights reserved.
//

#import "AnimateTabbar.h"

@interface AnimateTabbarView()

@property (nonatomic, assign) float tabitem_width;
@property (nonatomic, assign) float tabitem_hight;
@property (nonatomic, assign) float tab_hight;
@property (nonatomic, assign) float tab_width;
@property (nonatomic, assign) float other_offtop;
@property (nonatomic, assign) float img_hight;
@property (nonatomic, assign) float img_width;
@property (nonatomic, assign) float img_x;
@property (nonatomic, assign) float img_y;

@end
@implementation AnimateTabbarView
@synthesize  firstBtn,secondBtn,thirdBtn,fourthBtn,delegate,backBtn,shadeBtn;


- (id)initWithFrame:(CGRect)frame
{
    [self configUI];
    CGRect frame1=CGRectMake(frame.origin.x, frame.origin.y, self.tab_width, self.tab_hight);
    
    self = [super initWithFrame:frame1];
    if (self) {
        
        
        [self setBackgroundColor:[UIColor whiteColor]];
        backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setFrame:CGRectMake(0, 0, self.tab_width, self.tab_hight)];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_back"] forState:UIControlStateNormal];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_back"] forState:UIControlStateSelected];
        
        shadeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [shadeBtn setFrame:CGRectMake(0, self.other_offtop, self.tabitem_width, self.tabitem_hight)];
        [shadeBtn setBackgroundImage:[UIImage imageNamed:@"toolBar_shade"] forState:UIControlStateNormal];
        [shadeBtn setBackgroundImage:[UIImage imageNamed:@"toolBar_shade"] forState:UIControlStateSelected];
        
        UIImageView *btnImgView;
        
        //first
        btnImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabBar_0"] highlightedImage:[UIImage imageNamed:@"tabBar_0_on"]];
        btnImgView.frame = CGRectMake(self.img_x, self.img_y, self.img_width, self.img_hight);
        firstBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [firstBtn setFrame:CGRectMake(0, self.other_offtop, self.tabitem_width, self.tabitem_hight)];
        [firstBtn setTag:1];
        [firstBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [firstBtn addSubview:btnImgView];
        
        //second
        btnImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabBar_1"] highlightedImage:[UIImage imageNamed:@"tabBar_1_on"]];
        btnImgView.frame = CGRectMake(self.img_x, self.img_y, self.img_width, self.img_hight);
        secondBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [secondBtn setFrame:CGRectMake(self.tabitem_width, self.other_offtop, self.tabitem_width, self.tabitem_hight)];
        [secondBtn setTag:2];
        [secondBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [secondBtn addSubview:btnImgView];
        
        //third
        btnImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabBar_2"] highlightedImage:[UIImage imageNamed:@"tabBar_2_on"]];
        btnImgView.frame = CGRectMake(self.img_x, self.img_y, self.img_width, self.img_hight);
        thirdBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [thirdBtn setFrame:CGRectMake(self.tabitem_width*2, self.other_offtop, self.tabitem_width, self.tabitem_hight)];
        [thirdBtn setTag:3];
        [thirdBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [thirdBtn addSubview:btnImgView];
        
        //fourth
        btnImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabBar_3"] highlightedImage:[UIImage imageNamed:@"tabBar_3_on"]];
        btnImgView.frame = CGRectMake(self.img_x, self.img_y, self.img_width, self.img_hight);
        fourthBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [fourthBtn setFrame:CGRectMake(self.tabitem_width*3, self.other_offtop, self.tabitem_width, self.tabitem_hight)];
        [fourthBtn setTag:4];
        [fourthBtn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [fourthBtn addSubview:btnImgView];
        
        
        [backBtn addSubview:shadeBtn];
        
        [backBtn addSubview:firstBtn];
        [backBtn addSubview:secondBtn];
        [backBtn addSubview:thirdBtn];
        [backBtn addSubview:fourthBtn];
        
        [self addSubview:backBtn];
        
        
    }
    
    
    return self;
    
    
}
- (void)configUI  {
    self.tab_hight = 46;
    self.tab_width = kScreenWidth;
    self.tabitem_hight = 44;
    self.tabitem_width = kScreenWidth / 4.0;
    self.other_offtop = 2.0;
    
    self.img_hight = 38;
    self.img_width = 25;
    self.img_x = 34;
    self.img_y = 4;
}

-(void)callButtonAction:(UIButton *)sender{
    int value = (int)sender.tag;
    if (value == 1) {
        [self.delegate FirstBtnClick];
    }
    if (value == 2) {
        [self.delegate SecondBtnClick];
    }
    if (value == 3) {
        [self.delegate ThirdBtnClick];
    }
    if (value == 4) {
        [self.delegate FourthBtnClick];
    }
    
}

int g_selectedTag = 1;
-(void)buttonClickAction:(id)sender{
    UIButton *btn=(UIButton *)sender;
    if(g_selectedTag == btn.tag) {
        return;
    }else {
        g_selectedTag = (int)btn.tag;
    }
    
    if (firstBtn.tag != btn.tag) {
        ((UIImageView *)firstBtn.subviews[0]).highlighted = NO;
    }
    if (secondBtn.tag != btn.tag) {
        ((UIImageView *)secondBtn.subviews[0]).highlighted = NO;
    }
    if (thirdBtn.tag != btn.tag) {
        ((UIImageView *)thirdBtn.subviews[0]).highlighted = NO;
    }
    if (fourthBtn.tag != btn.tag) {
        ((UIImageView *)fourthBtn.subviews[0]).highlighted = NO;
    }
    [self moveShadeBtn:btn];
    [self imgAnimate:btn];
    ((UIImageView *)btn.subviews[0]).highlighted = YES;
    [self callButtonAction:btn];
    return;
}


- (void)moveShadeBtn:(UIButton*)btn{
    
    [UIView animateWithDuration:0.3 animations:
     ^(void){
         CGRect frame = shadeBtn.frame;
         frame.origin.x = btn.frame.origin.x;
         shadeBtn.frame = frame;
     } completion:^(BOOL finished){//do other thing
     }];
    
    
}

- (void)imgAnimate:(UIButton*)btn{
    
    UIView *view = btn.subviews[0];
    
    [UIView animateWithDuration:0.1 animations:^(void){
         view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
     } completion:^(BOOL finished){//do other thing
         [UIView animateWithDuration:0.2 animations:^(void){
              view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
          } completion:^(BOOL finished){//do other thing
              [UIView animateWithDuration:0.1 animations:^(void){
                   view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
               } completion:^(BOOL finished){//do other thing
               }];
          }];
     }];
}



@end
