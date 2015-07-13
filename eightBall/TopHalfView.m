//
//  TopHalfView.m
//  eightBall
//
//  Created by Justin Wong on 2015-07-11.
//  Copyright (c) 2015 justinSYDE. All rights reserved.
//

#import "TopHalfView.h"
#import <sys/sysctl.h>

@implementation TopHalfView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)isIPhone4 {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);

    if ([platform isEqualToString:@"iPhone4,1"] || [platform isEqualToString:@"x86_64"]) {
        return true;
    }
        return false;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupImgViewWithFrame:frame];
        [self setupAnswerView:frame];
    }
    
    return self;
}

- (NSArray *)validImages {
    if (!_validImages) _validImages = @[@"8ball", @"oneBall", @"twoBall", @"threeBall", @"empty", @"eightBall"];
    return _validImages;
}

- (UIImageView *)imgView {
    if (!_imgView) _imgView = [[UIImageView alloc] init];
    return _imgView;
}

- (UILabel *)answerLabel {
    if (!_answerLabel) _answerLabel = [[UILabel alloc] init];
    return _answerLabel;
}

- (void)setupImgViewWithFrame:(CGRect)frame {
    float width;
    if ([self isIPhone4]) {
        width = frame.size.width  * 0.5;
    } else {
        width = frame.size.width  * 0.6;
    }
    float const height = width;
    float const x = (frame.size.width - width) * 0.5;
    float const y = frame.size.height * 0.25;
    CGRect newFrame = CGRectMake(x, y, width, height);
    self.imgView.frame = newFrame;
    
    [self addSubview:self.imgView];
}

- (void)setImgViewImage:(NSString *)imgName {
    if ([self.validImages containsObject:imgName]) {
        if ([imgName isEqualToString:@"empty"]) {
            self.imgView.hidden = YES;
        } else {
            self.imgView.hidden = NO;
            [self.imgView setImage:[UIImage imageNamed:imgName]];
        }
    }
}

- (void)setupAnswerView:(CGRect)frame {
    float width, y;
    if ([self isIPhone4]) {
        width = frame.size.width  * 0.2;
        self.answerLabel.font = [UIFont fontWithName:@"Helvetica-bold" size:55.0];
        y = frame.size.height * 0.44;
    } else {
        width = frame.size.width  * 0.3;
        self.answerLabel.font = [UIFont fontWithName:@"Helvetica-bold" size:75.0];
        y = frame.size.height * 0.43;
    }
    float const height = width;
    float const x = (frame.size.width - width) * 0.5;
    
    CGRect newFrame = CGRectMake(x, y, width, height);
    self.answerLabel.frame = newFrame;
    [self.answerLabel setTextColor:[UIColor whiteColor]];
    self.answerLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.answerLabel];
}

- (void)setAnswerViewWithText:(NSString *)answer {
    self.answerLabel.text = answer;
}

@end
