//
//  LHGradientProgressView.h
//  layer
//
//  Created by LiHang on 14-4-15.
//  Copyright (c) 2014年 LiHang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHGradientProgressView : UIView

@property (nonatomic, readonly) CALayer *maskLayer;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, readonly, getter = isAnimating) BOOL animating;

- (void)startAnimation;
- (void)stopAnimation;
@end
