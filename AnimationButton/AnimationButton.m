//
//  AnimationButton.m
//  AnimationButton
//
//  Created by zhaolei on 16/7/8.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "AnimationButton.h"


@interface AnimationButton ()
{
    // animation is running or not
    BOOL animationing;
}


@property (nonatomic, strong) CAShapeLayer * animationLayer;

@end

@implementation AnimationButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTapGesture];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addTapGesture];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addTapGesture];
    }
    return self;
}

- (void)addTapGesture{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animationStart:)];
    [self addGestureRecognizer:tap];
}

- (void)animationStart:(UIGestureRecognizer *)gestureRecognizer{
    if (animationing) {
        return;
    }
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    animationing = YES;
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:MIN(self.bounds.size.width/4, self.bounds.size.height/4) startAngle:0 endAngle:M_PI_2 * 3 clockwise:YES];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    if (self.animationLayer) {
        [self.animationLayer removeAllAnimations];
        if ([self.animationLayer superlayer]) {
            [self.animationLayer removeFromSuperlayer];
        }
    }
    self.animationLayer = [[CAShapeLayer alloc] init];
    self.animationLayer.anchorPoint = CGPointMake(0.5, 0.5);
    self.animationLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.animationLayer.fillColor = [UIColor clearColor].CGColor;
    self.animationLayer.strokeColor = [UIColor greenColor].CGColor;
    self.animationLayer.lineWidth = 5;
    self.animationLayer.path = path.CGPath;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 0.8;
    animation.repeatCount = 1;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.autoreverses = NO;
    animation.delegate = self;
    [animation setValue:@"animationOne" forKey:@"animationName"];
    [self.animationLayer addAnimation:animation forKey:@"strokeEndAnimation"];
    
//    self.animationLayer.frame = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.siz;e.height/2);
    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [self.layer addSublayer:self.animationLayer];
}


- (void)animationDidStart:(CAAnimation *)anim{
//    NSLog(@"animationName ----> %@", [anim valueForKey:@"animationName"]);
//    if ([[anim valueForKey:@"animationName"] isEqualToString:@"strokeEndAnimation"]) {
//        
//    }
//    NSLog(@"anim---> %@", anim);
//    NSLog(@"layer---> %@", [self.layer animationForKey:@"strokeEndAnimation"]);
//    NSLog(@"animationLayer---> %@", [self.animationLayer animationForKey:@"strokeEndAnimation"]);
//    NSLog(@"layer---> %@", [self.layer animationForKey:@"strokeEnd"]);
//    NSLog(@"animationLayer---> %@", [self.animationLayer animationForKey:@"strokeEnd"]);
//    NSLog(@"------------------------------------");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"animationName ----> %@", [anim valueForKey:@"animationName"]);
    if ([[anim valueForKey:@"animationName"] isEqualToString:@"animationOne"]) {
        // 对Y轴进行旋转（指定Z轴的话，就和UIView的动画一样绕中心旋转）
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        [animation setValue:@"animationTwo" forKey:@"animationName"];
        // 设定动画选项
        animation.duration = 0.7; // 持续时间
        animation.repeatCount = 5; // 重复次数
        // 设定选装角度
        animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
        animation.toValue = [NSNumber numberWithFloat:2 * M_PI]; // 终止角度
        animation.delegate = self;
        // 添加动画
        [self.animationLayer addAnimation:animation forKey:@"rotate-layer"];
    }else if ([[anim valueForKey:@"animationName"] isEqualToString:@"animationTwo"]){
        UIBezierPath*path = [UIBezierPath bezierPath];
        path.lineCapStyle = kCGLineCapRound;
        path.lineJoinStyle = kCGLineCapRound;
        
        CGFloat centerX = self.bounds.size.width/2;
        CGFloat centerY = self.bounds.size.height/2;
        CGFloat radius = MIN(self.bounds.size.width/4, self.bounds.size.height/4);
        //勾的起点
        [path moveToPoint:CGPointMake(centerX - radius * 2 / 3, centerY + radius / 3 )];
        
        //勾的最低点
        CGPoint lowPoint = CGPointMake(centerX - radius / 3, centerY + radius * 2 / 3);
        [path addLineToPoint:lowPoint];
        
        CGPoint heightPoint = CGPointMake(centerX + radius * 2 / 3, centerY - radius * 2 / 3);
        [path addLineToPoint:heightPoint];
        
        
        self.animationLayer.path = path.CGPath;
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        
        animation.fromValue = @0;
        animation.toValue = @1;
        animation.duration = 1;
        animation.repeatCount = 1;
        //    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.autoreverses = NO;
        animation.delegate = self;
        [animation setValue:@"animationThree" forKey:@"animationName"];
        [self.animationLayer addAnimation:animation forKey:@"strokeEndAnimation"];
    }else if ([[anim valueForKey:@"animationName"] isEqualToString:@"animationThree"]){
        animationing = NO;
    }
}



@end
