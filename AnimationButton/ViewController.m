//
//  ViewController.m
//  AnimationButton
//
//  Created by zhaolei on 16/7/8.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ViewController.h"
#import "AnimationButton.h"

#define   kDegreesToRadians(degrees)  ((M_PI * degrees)/ 180)

@interface ViewController ()

@property (nonatomic, strong) UILabel * logoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    _logoView = [[UILabel alloc] init];
//    _logoView.frame =  CGRectMake(10, 100, 100, 100);
//    _logoView.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:_logoView];
    
    AnimationButton * button = [[AnimationButton alloc] initWithFrame:CGRectMake(150, 250, 200, 100)];
    button.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)finishAnimation{
    
}

- (void)loadingAnimation{


        
        CGPoint center = CGPointMake(_logoView.frame.size.width / 2, _logoView.frame.size.height / 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:100
                                                        startAngle:0
                                                          endAngle:kDegreesToRadians(135)
                                                         clockwise:YES];
        path.lineCapStyle = kCGLineCapRound;
        path.lineJoinStyle = kCGLineJoinRound;
        path.lineWidth = 5.0;
        
        UIColor *strokeColor = [UIColor redColor];
        [strokeColor set];
        
        [path stroke];

}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CGPoint pathCenter = CGPointMake(_logoView.frame.size.width/2,_logoView.frame.size.height/2);
//    UIBezierPath*path = [UIBezierPath bezierPathWithArcCenter:pathCenter radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineCapRound;
//    
//    
//    CGFloat x = _logoView.frame.size.width/2;
//    CGFloat y = _logoView.frame.size.height/2;
//    //勾的起点
//    [path moveToPoint:CGPointMake(x, y)];
//    //勾的最底端
//    CGPoint p1 =CGPointMake(x+10, y+ 10);
//    [path addLineToPoint:p1];
//    //勾的最上端
//    CGPoint p2 =CGPointMake(x+35,y-20);
//    [path addLineToPoint:p2];
//    //新建图层——绘制上面的圆圈和勾
//    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//    layer.fillColor = [UIColor clearColor].CGColor;
//    layer.strokeColor = [UIColor greenColor].CGColor;
//    layer.lineWidth = 5;
//    layer.path = path.CGPath;
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    
//    animation.fromValue = @0;
//    animation.toValue = @1;
//    animation.duration = 0.5;
//    animation.repeatCount = 1;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.autoreverses = NO;
//
//    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
//    
//    [_logoView.layer addSublayer:layer];
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
