//
//  ADProgressCircle.m
//  cycle1
//
//  Created by adu on 15/7/9.
//  Copyright (c) 2015年 adu. All rights reserved.
//

#import "ADProgressCircle.h"

@interface ADProgressCircle ()
@property(nonatomic,strong)CAShapeLayer *trackLayer;
@property(nonatomic,strong)CAShapeLayer *progressLayer;
@property (nonatomic, strong) CABasicAnimation *reverseProgressAnimation;
@end

@implementation ADProgressCircle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createProgressProgressCircle];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createProgressProgressCircle];
    }
    return self;
}
- (void)show{
    [self.progressLayer removeAllAnimations];
    self.reverseProgressAnimation.duration = _duration;
    [self.progressLayer addAnimation:self.reverseProgressAnimation forKey:@"strokeEnd"];
}

- (void)createProgressProgressCircle {
    
    _trackLayer = [CAShapeLayer new];
    [self.layer addSublayer:_trackLayer];
    _trackLayer.fillColor = nil;
    _trackLayer.frame = self.bounds;
    _trackLayer.strokeColor = [UIColor grayColor].CGColor;
    
    
    //
    self.progressLayer = [CAShapeLayer layer];
    CGPoint arcCenter = CGPointMake(CGRectGetMidY(self.bounds), CGRectGetMidX(self.bounds));
    CGFloat radius = CGRectGetMidX(self.bounds);
    CGPathRef path3 = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                     radius:radius
                                                 startAngle:- M_PI/2
                                                   endAngle:M_PI / 2 * 3
                                                  clockwise:1].CGPath;
    
    self.progressLayer.path = path3;
    self.progressLayer.position = CGPointMake( self.frame.size.width , self.frame.size.height / 2);
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = [UIColor blueColor].CGColor;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.lineJoin = kCALineJoinRound;
    self.progressLayer.lineWidth = 20;
    self.progressLayer.strokeStart = 0;
    self.progressLayer.strokeEnd = 0;
    self.progressLayer.frame = self.bounds;
    _progressWidth = 20;
    
    [self.layer addSublayer:self.progressLayer];
    
}



- (void)setCGpath{
    CGPoint arcCenter = CGPointMake(CGRectGetMidY(self.bounds), CGRectGetMidX(self.bounds));
    CGFloat radius = CGRectGetMidX(self.bounds);
    CGPathRef path3 = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                     radius:(radius - _progressWidth*0.5)
                                                 startAngle:- M_PI/2
                                                   endAngle:M_PI / 2 * 3
                                                  clockwise:1].CGPath;
    _trackLayer.path = path3;
    _progressLayer.path = path3;
}

#pragma mark - setter && getter
- (CABasicAnimation *)reverseProgressAnimation {
    
    if ( !_reverseProgressAnimation ){
        _reverseProgressAnimation = [CABasicAnimation animation];
        _reverseProgressAnimation.fromValue = @(0);
        _reverseProgressAnimation.toValue = [NSNumber numberWithDouble:_progress];
        _reverseProgressAnimation.duration =3.0f;
        _reverseProgressAnimation.fillMode = kCAFillModeForwards;
        _reverseProgressAnimation.removedOnCompletion = NO;
        _reverseProgressAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    }
    
    return _reverseProgressAnimation;
}
- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
}
- (void)setProgressWidth:(float)progressWidth{
    _progressWidth = progressWidth;
    self.trackLayer.lineWidth = progressWidth;
    
    self.progressLayer.lineWidth = progressWidth;
    
    [self setCGpath];
}

- (void)setProgressColor:(UIColor *)progressColor{
    self.progressLayer.strokeColor = progressColor.CGColor;
}
- (void)setTrackColor:(UIColor *)trackColor{
    self.trackLayer.strokeColor = trackColor.CGColor;
}
- (void)setDuration:(float)duration{
    _duration = duration;
    
}
@end
