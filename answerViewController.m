//
//  eightViewController.m
//  eightBall
//
//  Created by Justin Wong on 2014-11-04.
//  Copyright (c) 2014 justinSYDE. All rights reserved.
//

#import "answerViewController.h"

@interface answerViewController ()

@end

@implementation answerViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    
    self.answerLabel.text = _secretAnswer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
