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
    if (!_validImages) _validImages = @[@"oneBall", @"twoBall", @"threeBall", @"eightBall"];
    return _validImages;
}

- (UIImageView *)imgView {
    if (!_imgView) _imgView = [[UIImageView alloc] init];
    return _imgView;
}

- (void)setupImgViewWithFrame:(CGRect)frame {
    float const width = frame.size.width  * 0.8;
    float const height = frame.size.height * 0.8;
    float const x = (frame.size.width - width) * 0.5;
    float const y = 0;
    CGRect newFrame = CGRectMake(x, y, width, height);
    self.imgView.frame = newFrame;
}

- (void)setImgViewImage:(NSString *)imgName {
    if ([self.validImages containsObject:imgName]) {
        [self.imgView setImage:[UIImage imageNamed:imgName]];
    }
}

- (void)hideImgView:(BOOL)hide {
    self.imgView.hidden = hide;
}

@end
