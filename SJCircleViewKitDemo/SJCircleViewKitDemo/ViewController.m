//
//  ViewController.m
//  SJCircleViewKitDemo
//
//  Created by SoulJa on 2017/7/30.
//  Copyright © 2017年 com.shengpay.mpos.shengshua. All rights reserved.
//

#import "ViewController.h"
#import "SJCircleView.h"

@interface ViewController ()
/**定时器**/
@property (nonatomic,strong) NSTimer *timer;
/**圆环**/
@property (nonatomic,strong) SJCircleView *circleView;
/**进度**/
@property (nonatomic,assign) double progress;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _circleView = [[SJCircleView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:_circleView];
    
    _progress = 0.0;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:.1f target:self selector:@selector(setProgress) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)setProgress {
    _progress += 0.01;
    if (_progress >= 1) {
        _progress = 0;
    }
    
    [_circleView drawProgress:_progress];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
