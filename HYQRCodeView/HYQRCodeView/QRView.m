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
{
    NSTimer *timer;
    UIImageView *lineImg;
    CGRect rect;
}
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
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        [self addSubview:bgView];
        
        UIBlurEffect *blurForHeadImage = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        /** 创建UIVisualEffectView的对象visualView, 以blur为参数. */
        UIVisualEffectView *HeadImage = [[UIVisualEffectView alloc] initWithEffect:blurForHeadImage];
        /** 将visualView的大小等于头视图的大小. (visualView的大小可以自行设定, 它的大小决定了显示毛玻璃效果区域的大小.) */
        HeadImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        // 透明度
        HeadImage.alpha = 1;
        /** 将visualView添加到blurImageView上. */
        [bgView addSubview:HeadImage];
        
        rect = CGRectMake(self.frame.size.width/6, self.frame.size.height/2 - self.frame.size.width/3, self.frame.size.width*2/3, self.frame.size.width*2/3);
  
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

        [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0] bezierPathByReversingPath]];
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        [bgView.layer setMask:shapeLayer];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self addSubview:view];
        
        
        UIImageView *topLeftImg = [[UIImageView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, 20, 20)];
        topLeftImg.contentMode = UIViewContentModeScaleAspectFit;
        topLeftImg.image = [UIImage imageNamed:@"QRCodeLeftTop"];
        [view addSubview:topLeftImg];
        
        UIImageView *topRightImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(rect) - 20, rect.origin.y, 20, 20)];
        topRightImg.contentMode = UIViewContentModeScaleAspectFit;
        topRightImg.image = [UIImage imageNamed:@"QRCodeRightTop"];
        [view addSubview:topRightImg];
        
        UIImageView *bottomLeftImg = [[UIImageView alloc] initWithFrame:CGRectMake(rect.origin.x, CGRectGetMaxY(rect)-20, 20, 20)];
        bottomLeftImg.contentMode = UIViewContentModeScaleAspectFit;
        bottomLeftImg.image = [UIImage imageNamed:@"QRCodeLeftBottom"];
        [view addSubview:bottomLeftImg];
        
        UIImageView *bottomRightImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(rect) - 20, CGRectGetMaxY(rect)-20, 20, 20)];
        bottomRightImg.contentMode = UIViewContentModeScaleAspectFit;
        bottomRightImg.image = [UIImage imageNamed:@"QRCodeRightBottom"];
        [view addSubview:bottomRightImg];
        
        lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 10)];
//        lineImg.contentMode = UIViewContentModeScaleAspectFit;
        lineImg.image = [UIImage imageNamed:@"QRCodeScanningLine"];
        [view addSubview:lineImg];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self lineMobile];
        });
        
        UIButton *lightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        lightBtn.frame = CGRectMake(self.frame.size.width/2 - 25, self.frame.size.height - 100, 50, 50);
        [lightBtn setTitle:@"开灯" forState:(UIControlStateNormal)];
        [lightBtn setTitle:@"关灯" forState:UIControlStateSelected];
        [lightBtn setImage:[UIImage imageNamed:@"Light_black"] forState:UIControlStateNormal];
        [lightBtn setImage:[UIImage imageNamed:@"Light_white"] forState:UIControlStateSelected];
        [lightBtn addTarget:self action:@selector(offAndNoLight:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:lightBtn];
    }
    return self;
}

- (void)offAndNoLight:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (self.block) {
        self.block(sender);
    }
}

- (void)lineMobile{
    [UIView animateWithDuration:2 animations:^{
        lineImg.transform = CGAffineTransformMakeTranslation(0, rect.size.height-10);
    } completion:^(BOOL finished) {
        lineImg.transform = CGAffineTransformIdentity;
        [self lineMobile];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
