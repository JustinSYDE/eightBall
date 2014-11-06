//
//  ViewController.m
//  eightBall
//
//  Created by Justin Wong on 2014-11-01.
//  Copyright (c) 2014 justinSYDE. All rights reserved.
//

#import "ViewController.h"
#import "answerViewController.h"

@interface ViewController ()

//@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation ViewController {
    NSMutableArray *array;
    NSString *ans;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*------------------------------------- SYMBOL TABLE ---------------------------------------*/

    array = [[NSMutableArray alloc] init];
    NSString *glyphArray[10] = {@"❧", @"Ω", @"ྡྷ", @"۝", @"ཆ", @"☯", @"♞", @"྿", @"☢", @"Ж"};
    int num9 = arc4random_uniform(10);
    int num;
    NSString *number;
    
    for (int i = 99; i >= 0; i--){
        do {
            num = arc4random_uniform(10);
        }while(num == num9);
        
        
        if ((i != 0 && i != 99) && (i%9 == 0)){
            number = [NSString stringWithFormat:@"%@%i", glyphArray[num9], i];
        }
        
        else{
            number = [NSString stringWithFormat: @"%@%i", glyphArray[num], i];
        }
        
        [array addObject: number];
    }
    
    ans = glyphArray[num9];
    
    /*self.answerLabel.text = glyphArray[num9];*/

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueFromTableToAnswer"])
    {
        answerViewController *controller = (answerViewController *)segue.destinationViewController;
        controller.secretAnswer = ans;
    }
}


#pragma mark Collection View Methods

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [array count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag: 100];
    label.text = [array objectAtIndex: indexPath.row];
    
    return cell;
}
@end

