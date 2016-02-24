//
//  SKVerificationCodeView.m
//  SKVerificationCodeDemo
//
//  Created by Apple on 16/2/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "SKVerificationCodeView.h"

#define SKARGBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define SKColor(r, g, b) SKARGBColor(r, g, b, 1.0)
#define SKRandomColor SKColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@implementation SKVerificationCodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.codeCount = 4;
        [self changeCodeString];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self changeCodeString];
    [self setNeedsDisplay];
}

- (void)changeCodeString {
    NSMutableString *getStr = [[NSMutableString alloc] initWithCapacity:1];
    self.changeString = [[NSMutableString alloc] initWithCapacity:self.codeCount];
    
    for (NSInteger i = 0; i < self.codeCount; ++i) {
        NSInteger index = arc4random() % (self.changeArray.count - 1);
        getStr = [self.changeArray objectAtIndex:index];
        
        [self.changeString appendString:getStr];
    }
    NSLog(@"%@",self.changeString);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    self.backgroundColor = SKRandomColor;
    
    NSString *text = [NSString stringWithString:self.changeString];
    NSDictionary *attributesDict = @{NSFontAttributeName : [UIFont systemFontOfSize:25]};
    CGSize cSize = [@"S" sizeWithAttributes:attributesDict];
    int width = rect.size.width / text.length - cSize.width;
    int heigh = rect.size.height - cSize.height;
    
    CGPoint point;
    CGFloat pX, pY;
    for (int i = 0; i < text.length; i++) {
        pX = arc4random() % width + rect.size.width / text.length * i;
        pY = arc4random() % heigh;
        
        point = CGPointMake(pX, pY);
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%c",c];
        NSDictionary *attributesDict = @{
                                         NSFontAttributeName : [UIFont systemFontOfSize:25],
                                         NSForegroundColorAttributeName : SKRandomColor
                                         };
        [textC drawAtPoint:point withAttributes:attributesDict];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    
    // 绘制干扰线
    for (int i = 0; i < 10; ++i) {
        CGContextSetStrokeColorWithColor(context, SKRandomColor.CGColor);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        CGContextStrokePath(context);
    }
    
    self.changeString = [NSMutableString stringWithString:[self.changeString lowercaseString]];
}

#pragma mark - lazy

- (NSArray *)changeArray {
    if (!_changeArray) {
        _changeArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    }
    return _changeArray;
}

@end
