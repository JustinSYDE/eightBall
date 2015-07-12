//
//  ViewController.m
//  eightBall
//
//  Created by Justin Wong on 2014-11-01.
//  Copyright (c) 2014 justinSYDE. All rights reserved.
//

#import "ViewController.h"
#import "TopHalfView.h"
#import "BottomHalfView.h"

@interface ViewController ()
@property (nonatomic) NSArray *glyphArray;
@property (nonatomic) NSString *ans;
@property (nonatomic) NSMutableArray *array;
@property (nonatomic) NSInteger step;
@property (nonatomic) TopHalfView *topHalfView;
@property (nonatomic) BottomHalfView *bottomHalfView;
@end

@implementation ViewController

- (NSArray *)glyphArray {
    if (!_glyphArray)
        _glyphArray = @[@"❧", @"Ω", @"ྡྷ", @"۝", @"ཆ", @"☯", @"♞", @"྿", @"☢", @"Ж"];
    return _glyphArray;
}

- (NSString *)ans {
    if (!_ans)
        _ans = [[NSString alloc] init];
    return _ans;
}

- (NSMutableArray *)array {
    if (!_array)
        _array = [[NSMutableArray alloc] init];
    
    return _array;
}

- (NSInteger)step {
    if (!_step)
        _step = 0;
    return _step;
}

- (TopHalfView *)topHalfView {
    if (!_topHalfView) {
        float const width = self.view.frame.size.width;
        float const height = self.view.frame.size.height * 0.5;
        float const x = 0;
        float const y = 0;
        CGRect newFrame = CGRectMake(x, y, width, height);
        _topHalfView = [[TopHalfView alloc] initWithFrame:newFrame];
    }
    
    return _topHalfView;
}

- (BottomHalfView *)bottomHalfView {
    if (!_bottomHalfView) {
        float const width = self.view.frame.size.width;
        float const height = self.view.frame.size.height * 0.5;
        float const x = 0;
        float const y = self.view.frame.size.height *0.5;
        CGRect newFrame = CGRectMake(x, y, width, height);
        _bottomHalfView = [[BottomHalfView alloc] initWithFrame:newFrame];
    }
    
    return _bottomHalfView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topHalfView];
    [self.view addSubview:self.bottomHalfView];
    [self updateUI];
}

- (void)updateUI {
    NSString *imgName = self.topHalfView.validImages[self.step];
    NSString *description = self.bottomHalfView.validDescriptions[self.step];
    [self.topHalfView setImgViewImage:imgName];
    [self.bottomHalfView setDescriptionWithText:description];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)displaySymbolsTable {
    self.array = [[NSMutableArray alloc] init];
    int num9 = arc4random_uniform(10);
    int num;
    NSString *number;
    
    for (int i = 99; i >= 0; i--){
        do {
            num = arc4random_uniform(10);
        }while(num == num9);
        
        
        if ((i != 0 && i != 99) && (i%9 == 0)){
            number = [NSString stringWithFormat:@"%@%i", self.glyphArray[num9], i];
        }
        
        else{
            number = [NSString stringWithFormat: @"%@%i", self.glyphArray[num], i];
        }
        
        [self.array addObject: number];
    }
    
    self.ans = self.glyphArray[num9];

}


#pragma mark Collection View Methods

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.array count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag: 100];
    label.text = [self.array objectAtIndex: indexPath.row];
    
    return cell;
}

@end

