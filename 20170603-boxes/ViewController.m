//
//  ViewController.m
//  20170603-boxes
//
//  Created by iOS-School-1 on 03/06/2017.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ViewController.h"

NSTimeInterval animationDuration = 3;
CGPoint blackBoxCenterStored;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIView *blackBox;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    blackBoxCenterStored = self.blackBox.center;
}

- (IBAction)button1Click:(id)sender {    
    [UIView animateWithDuration:animationDuration animations:^{
        self.blackBox.alpha = 0;
    }];
}

- (IBAction)button2Click:(id)sender {
    [UIView animateWithDuration:animationDuration animations:^{
        self.blackBox.alpha = 1;
    }];
}

- (IBAction)button3Click:(id)sender {
    CGAffineTransform transform = self.blackBox.transform;
    [UIView animateWithDuration:animationDuration animations:^{
        self.blackBox.transform = CGAffineTransformRotate(transform, M_PI / 2);
        self.blackBox.center = blackBoxCenterStored;
    }];
}

- (IBAction)button4Click:(id)sender {
    CGPoint blackBoxCenter = self.blackBox.center;
    blackBoxCenter.y += 500;
    [UIView animateWithDuration:animationDuration animations:^{
        self.blackBox.center = blackBoxCenter;
    }];
}
- (IBAction)button5Click:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [self.blackBox.layer addAnimation:animation forKey:@"shake"];
    
    for (CALayer *layer in @[self.button1, self.button2, self.button3, self.button4 ]) {
        [layer addAnimation:animation forKey:@"shake"];
    }
}

- (IBAction)button6Click:(id)sender {

    CGRect boundingRect = CGRectMake(-15, -15, 30, 30);
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;

    if ([self.button1.layer.animationKeys containsObject:@"orbit"]) {
        [self.button1.layer removeAnimationForKey:@"orbit"];
    } else {
        [self.button1.layer addAnimation:orbit forKey:@"orbit"];
    }
}

@end
