//
//  ViewController.m
//  Alipay-xiuyixiu
//
//  Created by 大家保 on 16/8/18.
//  Copyright © 2016年 大家保. All rights reserved.
//

#import "ViewController.h"
#define xiuyixiuTime 3
#define layerWidth 10

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
}

- (void)startAnimation{
    
    CALayer*layer = [CALayer layer];
    
    layer.bounds=CGRectMake(0,0, layerWidth, layerWidth);
    
    layer.position=self.view.center;
    
    layer.cornerRadius=(layerWidth)/2;
    
    layer.backgroundColor= [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
    //圆的大小改变
    
    CABasicAnimation*boundsAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    boundsAnimation.fromValue= [NSNumber numberWithFloat:1];
    
    boundsAnimation.toValue= [NSNumber numberWithFloat:self.view.frame.size.width/layerWidth];
    
    boundsAnimation.removedOnCompletion=YES;
    
    boundsAnimation.duration=xiuyixiuTime;
    
    
    
    //透明度的改变
    
    CABasicAnimation*opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    opacityAnimation.fromValue= [NSNumber numberWithFloat:1];
    
    opacityAnimation.toValue= [NSNumber numberWithFloat:0];
    
    opacityAnimation.removedOnCompletion=YES;
    
    opacityAnimation.duration=xiuyixiuTime;
    
    //创建动画组
    
    CAAnimationGroup*group = [CAAnimationGroup animation];
    
    group.animations=@[boundsAnimation, opacityAnimation];
    
    group.duration=xiuyixiuTime;
    
    group.removedOnCompletion=YES;
    
    group.beginTime=0;
    
    group.fillMode=kCAFillModeBoth;
    
    
    [layer addAnimation:group forKey:@"xiuyixiu"];
    
    //动画完成后移除Layer
    
    [self performSelector:@selector(removeLayer:)withObject:layer afterDelay:xiuyixiuTime];
    
}

//移除Layer

- (void)removeLayer:(CALayer*)layer{
    [layer removeFromSuperlayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
