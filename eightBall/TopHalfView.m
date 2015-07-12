//
//  TopHalfView.m
//  eightBall
//
//  Created by Justin Wong on 2015-07-11.
//  Copyright (c) 2015 justinSYDE. All rights reserved.
//

#import "TopHalfView.h"

@implementation TopHalfView

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
        [self setupImgViewWithFrame:frame];
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

- (void)setupImgViewWithFrame:(CGRect)frame {
    float const width = frame.size.width  * 0.6;
    float const height = frame.size.height * 0.7;
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

@end
