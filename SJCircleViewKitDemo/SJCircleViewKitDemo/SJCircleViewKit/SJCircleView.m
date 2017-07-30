//
//  SJCircleView.m
//  SJCircleViewKitDemo
//
//  Created by SoulJa on 2017/7/30.
//  Copyright © 2017年 com.shengpay.mpos.shengshua. All rights reserved.
//

#import "SJCircleView.h"

@implementation SJCircleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //圆环宽度
        self.circleWidth = 10;
        //圆环颜色
        self.circleColor = [UIColor blackColor];
        //背景颜色
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置圆心位置
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    // 半径
    CGFloat radius = rect.size.width / 2 - _circleWidth;
    
    //起点
    CGFloat startA = - M_PI_2;
    //终点
    CGFloat endA = - M_PI_2 + M_PI * 2 * _progress;
    
    // 贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    //线宽
    CGContextSetLineWidth(context, _circleWidth);
    
    //设置描边颜色
    [_circleColor setStroke];
    
    //添加路径
    CGContextAddPath(context, path.CGPath);
    
    //渲染
    CGContextStrokePath(context);
}

#pragma mark - 绘制圆环
- (void)drawProgress:(double)progress {
    if (progress > 1.000 || progress < 0.000) {
        return;
    }
    
    if (progress == 0) {
        for (UIView *subview in self.subviews) {
            [subview removeFromSuperview];
        }
    }
    
    _progress = progress;
    [self setNeedsDisplay];
}

@end
