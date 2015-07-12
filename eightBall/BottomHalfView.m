//
//  BottomHalfView.m
//  eightBall
//
//  Created by Justin Wong on 2015-07-11.
//  Copyright (c) 2015 justinSYDE. All rights reserved.
//

#import "BottomHalfView.h"

@implementation BottomHalfView

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (UIButton *)mainBtn {
    if (!_mainBtn) _mainBtn = [[UIButton alloc] init];
    return _mainBtn;
}

- (UIButton *)resetBtn {
    if (!_resetBtn) _resetBtn = [[UIButton alloc] init];
    return _resetBtn;
}

- (UILabel *)descriptionText {
    if (!_descriptionText) _descriptionText = [[UILabel alloc] init];
    return _descriptionText;
}


- (NSArray *)validDescriptions {
    if (!_validDescriptions) _validDescriptions = @[@"Are you ready?", @"Choose any 2-digit number between 10 and 99", @"Sum both digits of your 2-digit number ", @"Subtract the sum from your original 2-digit number", @"Focus on your number's symbol", @"Was this your symbol?"];
    return _validDescriptions;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupDescriptionWithFrame:frame];
        [self setupMainBtnWithFrame:frame];
        [self setupResetBtnWithFrame:frame];
    }
    
    return self;
}

- (void)setupDescriptionWithFrame:(CGRect)frame {
    float const width = frame.size.width  * 0.8;
    float const height = frame.size.height * 0.4;
    float const x = (frame.size.width - width) * 0.5;
    float const y = 0;
    CGRect newFrame = CGRectMake(x, y, width, height);
    self.descriptionText.frame = newFrame;
    
    self.descriptionText.backgroundColor = [UIColor clearColor];
    self.descriptionText.numberOfLines = 3;
    self.descriptionText.textAlignment = NSTextAlignmentCenter;
    self.descriptionText.font = [UIFont fontWithName:@"Helvetica" size:24.0];
    [self addSubview:self.descriptionText];
}

- (void)setupMainBtnWithFrame:(CGRect)frame {
    float const width = frame.size.width / 3.0;
    float const height = frame.size.height / 5.0;
    float const x = width;
    float const y = frame.size.height * 0.5;
    CGRect newFrame = CGRectMake(x, y, width, height);
    self.mainBtn.frame = newFrame;
    
    self.mainBtn.backgroundColor = [self colorFromHexString:@"#0f75bc"];
    [self.mainBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.mainBtn.layer.cornerRadius = 8;
    
    [self addSubview:self.mainBtn];
}

- (void)setupResetBtnWithFrame:(CGRect)frame {
    float const width = frame.size.width / 3.0;
    float const height = frame.size.height / 5.0;
    float const x = width;
    float const y = frame.size.height * 0.7;
    CGRect newFrame = CGRectMake(x, y, width, height);
    self.resetBtn.frame = newFrame;
    
    [self.resetBtn setTitleColor:[self colorFromHexString:@"#0f75bc"] forState:UIControlStateNormal];
    self.resetBtn.backgroundColor = [UIColor clearColor];
    [self.resetBtn setTitle:@"Reset" forState:UIControlStateNormal];
    
    [self addSubview:self.resetBtn];
}

- (void)setMainBtnText:(NSString *)text {
    [self.mainBtn setTitle:text forState:UIControlStateNormal];
}

- (void)hideResetBtn:(BOOL)hide{
    self.resetBtn.hidden = hide;
}

- (void)setDescriptionWithText:(NSString *)text {
    if ([self.validDescriptions containsObject:text]) {
        [self.descriptionText setText:text];
    }
}

@end
