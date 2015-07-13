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
@property (nonatomic) UICollectionView *collectionView;
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
    [self generateData];
    [self.view addSubview:self.topHalfView];
    [self setupCollectionView];
    [self.view addSubview:self.bottomHalfView];
    
    [self.bottomHalfView.mainBtn addTarget:self action:@selector(increaseStepCount) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomHalfView.resetBtn addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    
    [self updateUI];
}

- (void)increaseStepCount {
    if (self.step >= 5) {
        [self reset];
    } else {
        self.step++;
        [self updateUI];
    }
}

- (void)reset {
    self.step = 0;
    [self.array removeAllObjects];
    [self generateData];
    [self updateUI];
    [self.collectionView reloadData];
}

- (void)updateUI {
    NSString *imgName = self.topHalfView.validImages[self.step];
    NSString *description = self.bottomHalfView.validDescriptions[self.step];
    NSString *btnText = self.bottomHalfView.validBtnTexts[self.step];
    [self.topHalfView setImgViewImage:imgName];
    [self.bottomHalfView setDescriptionWithText:description];
    [self.bottomHalfView setMainBtnText:btnText];
    
    if (self.step == 5) {
        [self.topHalfView setAnswerViewWithText:self.ans];
    }
    
    self.collectionView.hidden = (self.step == 4) ? NO : YES;
    self.bottomHalfView.resetBtn.hidden = (self.step == 0) ? YES : NO;
    self.topHalfView.answerLabel.hidden = (self.step == 5) ? NO : YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    CGRect newFrame = CGRectMake(0, self.view.frame.size.height * 0.04, self.view.frame.size.width, self.view.frame.size.height * 0.5);
    self.collectionView=[[UICollectionView alloc] initWithFrame:newFrame collectionViewLayout:layout];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.collectionView];
    self.collectionView.hidden = YES;
}

- (void)generateData {
    int num9 = arc4random_uniform(10);
    int num;
    NSString *number;
    
    for (int i = 99; i >= 0; i--){
        do {
            num = arc4random_uniform(10);
        }while(num == num9);
        
        if ((i != 0 && i != 99) && (i%9 == 0)) {
            number = [NSString stringWithFormat:@"%@%i", self.glyphArray[num9], i];
        } else {
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
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:cell.bounds];
        label.tag = 100;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        [cell.contentView addSubview:label];
    }
    
    label.text = [self.array objectAtIndex:indexPath.row];
    
    return cell;
}

@end

