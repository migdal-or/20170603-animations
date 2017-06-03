//
//  ViewController.m
//  20170603-boxes
//
//  Created by iOS-School-1 on 03/06/2017.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ViewController.h"

NSTimeInterval animationDuration = 1;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
