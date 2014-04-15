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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor blackColor];
    
    LHGradientProgressView *layerView = [[LHGradientProgressView alloc] initWithFrame:CGRectMake(0, 60, 320, 2)];
    [self.view addSubview:layerView];
    
    [layerView setProgress:0.5];
    [layerView startAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
