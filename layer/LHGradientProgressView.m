//
//  LHGradientProgressView.m
//  layer
//
//  Created by LiHang on 14-4-15.
//  Copyright (c) 2014年 LiHang. All rights reserved.
//

#import "LHGradientProgressView.h"

@interface LHGradientProgressView ()

@property (nonatomic, strong) CALayer *maskLayer;
@end
@implementation LHGradientProgressView

+ (Class)layerClass{
    return [CAGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        CAGradientLayer *layer = (id)[self layer];
        [layer setStartPoint:CGPointMake(0.0, 0.5)];
        [layer setEndPoint:CGPointMake(1.0, 0.5)];
        
        NSMutableArray *colors = [NSMutableArray array];
        for (NSInteger hue = 0; hue <= 360; hue ++) {
            UIColor *color = nil;
            color = [UIColor colorWithHue:1.0 * hue / 360.0
                               saturation:1.0
                               brightness:1.0
                                    alpha:1.0];
            [colors addObject:(id)[color CGColor]];
        }
        [layer setColors:[NSArray arrayWithArray:colors]];
        
        
        self.maskLayer = [CALayer layer];
        [_maskLayer setFrame:CGRectMake(0, 0, 0, CGRectGetHeight(frame))];
        [_maskLayer setBackgroundColor:[[UIColor blackColor] CGColor]];
        [layer setMask:_maskLayer];
    }
    return self;
}

- (void)setProgress:(CGFloat)progressValue{

    if (_progress != progressValue) {
        _progress = MIN(1.0, fabs(progressValue));
        [self setNeedsLayout];
    }
    _progress = progressValue;
}

- (void)performAnimation{
    CAGradientLayer *layer = (id)[self layer];
    NSMutableArray *array = [[layer colors] mutableCopy];
    id lastColor = [array lastObject];
    [array removeLastObject];
    [array insertObject:lastColor atIndex:0];
    
    NSArray *shiftedColors = [NSArray arrayWithArray:array];
    
    [layer setColors:shiftedColors];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    [animation setToValue:shiftedColors];
    [animation setDuration:0.01];
    [animation setRemovedOnCompletion:YES];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setDelegate:self];
    
    [layer addAnimation:animation forKey:@"animateGradient"];
}

- (void)startAnimation{
    if (![self isAnimating]) {
        _animating = YES;
        [self performAnimation];
    }
}

- (void)stopAnimation{
    if ([self isAnimating]) {
        _animating = NO;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([self isAnimating]) {
        [self performAnimation];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect maskRect = [_maskLayer frame];
    maskRect.size.width = CGRectGetWidth([self bounds]) * _progress;
    [_maskLayer setFrame:maskRect];
}

@end
