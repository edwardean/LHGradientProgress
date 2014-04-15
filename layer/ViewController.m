//
//  ViewController.m
//  layer
//
//  Created by LiHang on 14-4-15.
//  Copyright (c) 2014年 LiHang. All rights reserved.
//

#import "ViewController.h"
#import "LHGradientProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) LHGradientProgressView *layerView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor blackColor];
    
    self.layerView = [[LHGradientProgressView alloc] initWithFrame:CGRectMake(0, 60, 320, 2)];
    [self.view addSubview:_layerView];

    [_layerView startAnimation];
    
    NSTimer *animationTimer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(layerAnimation:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:animationTimer forMode:NSDefaultRunLoopMode];
}

- (void)layerAnimation:(id)sender{
    if (_layerView.progress + 0.01 >= 1.0) {
        _layerView.progress = 0.0;
    }
    _layerView.progress += 0.01;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
