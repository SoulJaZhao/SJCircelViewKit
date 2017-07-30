//
//  SJCircleView.h
//  SJCircleViewKitDemo
//
//  Created by SoulJa on 2017/7/30.
//  Copyright © 2017年 com.shengpay.mpos.shengshua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJCircleView : UIView
/**进度 0-1 之间**/
@property (nonatomic,assign) double progress;
/**圆环宽度**/
@property (nonatomic,assign) double circleWidth;
/**圆环颜色**/
@property (nonatomic,strong) UIColor *circleColor;

/**
 *  绘制圆环
 *  @param progress 绘制进度 0-1之间
 */
- (void)drawProgress:(double)progress;
@end
