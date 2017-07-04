//
//  QRView.m
//  HYQRCodeView
//
//  Created by 吴昊原 on 2017/7/3.
//  Copyright © 2017年 HYQRCodeView. All rights reserved.
//

#import "QRView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface QRView ()


@end

@implementation QRView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
//        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(self.frame.size.width/4, self.frame.size.height/2-self.frame.size.width/4, self.frame.size.width/2, self.frame.size.width/2)];
//        
//        CAShapeLayer *layer = [CAShapeLayer layer];
//        //填充颜色
//        layer.fillColor = [UIColor clearColor].CGColor;
//        //边框颜色
//        layer.strokeColor = [UIColor blackColor].CGColor;
//        layer.path = path.CGPath;
//        [self.layer addSublayer:layer];
        
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(self.frame.size.width/4, frame.size.height/2 - frame.size.width/4, self.frame.size.width/2, self.frame.size.width/2);
//        [self.layer addSublayer:layer];
//
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        [self addSubview:view];
        
        UIBlurEffect *blurForHeadImage = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        /** 创建UIVisualEffectView的对象visualView, 以blur为参数. */
        UIVisualEffectView *HeadImage = [[UIVisualEffectView alloc] initWithEffect:blurForHeadImage];
        /** 将visualView的大小等于头视图的大小. (visualView的大小可以自行设定, 它的大小决定了显示毛玻璃效果区域的大小.) */
        HeadImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        // 透明度
        HeadImage.alpha = 1;
        /** 将visualView添加到blurImageView上. */
        [view addSubview:HeadImage];
  
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

        [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.frame.size.width/4, self.frame.size.height/2 - self.frame.size.width/4, self.frame.size.width/2, self.frame.size.width/2) cornerRadius:0] bezierPathByReversingPath]];
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        [self.layer setMask:shapeLayer];
        
        
        
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
