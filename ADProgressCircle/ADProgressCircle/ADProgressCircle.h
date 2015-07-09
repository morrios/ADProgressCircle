//
//  ADProgressCircle.h
//  cycle1
//
//  Created by adu on 15/7/9.
//  Copyright (c) 2015年 adu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADProgressCircle : UIView
/**
 *  进度条进度（0~1）
 */
@property (nonatomic, assign) CGFloat progress;
/**
 *  进度条背景色
 */
@property (nonatomic, strong) UIColor *trackColor;
/**
 *  进度条颜色
 */
@property (nonatomic, strong) UIColor *progressColor;
/**
 *  进度条宽度
 */
@property (nonatomic) float progressWidth;
/**
 *  动画时间
 */
@property (nonatomic) float duration;

/**
 *  动画显示
 */
- (void)show;
@end
