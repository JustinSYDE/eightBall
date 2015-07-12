//
//  BottomHalfView.h
//  eightBall
//
//  Created by Justin Wong on 2015-07-11.
//  Copyright (c) 2015 justinSYDE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomHalfView : UIView

@property (nonatomic) UIButton *mainBtn;
@property (nonatomic) UIButton *resetBtn;
@property (nonatomic) UILabel *descriptionText;
@property (nonatomic) NSArray *validDescriptions;

- (void)setMainBtnText:(NSString *)text;
- (void)hideResetBtn:(BOOL) hide;
- (void)setDescriptionWithText:(NSString *)text;

@end
