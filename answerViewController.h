//
//  answerViewController.h
//  eightBall
//
//  Created by Justin Wong on 2014-11-04.
//  Copyright (c) 2014 justinSYDE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface answerViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property(nonatomic) NSString *secretAnswer;
@end
