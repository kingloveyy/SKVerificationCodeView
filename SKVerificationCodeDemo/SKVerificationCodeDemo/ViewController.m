//
//  ViewController.m
//  SKVerificationCodeDemo
//
//  Created by Apple on 16/2/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "SKVerificationCodeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SKVerificationCodeView *verificationCodeView = [[SKVerificationCodeView alloc] init];
    verificationCodeView.frame = CGRectMake(100, 100, 120, 44);
    verificationCodeView.codeCount = 6;
    [self.view addSubview:verificationCodeView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
