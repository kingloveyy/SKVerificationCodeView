//
//  SKVerificationCodeView.h
//  SKVerificationCodeDemo
//
//  Created by Apple on 16/2/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKVerificationCodeView : UIView

@property (nonatomic) NSArray *changeArray;
@property (nonatomic) NSMutableString *changeString;
@property (nonatomic, assign) NSInteger codeCount;
@end
