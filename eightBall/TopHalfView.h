//
//  TopHalfView.h
//  eightBall
//
//  Created by Justin Wong on 2015-07-11.
//  Copyright (c) 2015 justinSYDE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopHalfView : UIView
@property (nonatomic) UIImageView *imgView;
@property (nonatomic) NSArray *validImages;
@property (nonatomic) NSArray *validDescriptions;
@property (nonatomic) UILabel *answerLabel;

- (void)setImgViewImage:(NSString *)imgName;
- (void)setAnswerViewWithText:(NSString *)answer;

@end
