//
//  ViewController.m
//  ADProgressCircle
//
//  Created by adu on 15/7/9.
//  Copyright (c) 2015年 adu. All rights reserved.
//

#import "ViewController.h"
#import "ADProgressCircle.h"

@interface ViewController ()
@property (nonatomic, strong) ADProgressCircle *progress;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progress.progress = 0.7;
    
}
#define ADCustomColor(r , g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0  blue:(b)/255.0  alpha:(a)/255.0 ]

- (ADProgressCircle *)progress{
    if (!_progress) {
        _progress = [[ADProgressCircle alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _progress.progressWidth = 7;
        _progress.duration = 0.5;
        _progress.trackColor = ADCustomColor(246, 246, 246, 255);
        [self.view addSubview:_progress];
    }
    return _progress;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_progress show];
  
}

@end
