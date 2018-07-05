//
//  ViewController.m
//  collectionViewExample
//
//  Created by User on 7/4/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "TaskDetailVC.h"

@interface ViewController ()
@end

static NSString *const cellIdentifire = @"cellIdentifire";

@implementation ViewController
@synthesize data = _data, myCollectionView = _myCollectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setView:[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds]];
    _data = @[];
    [self setUpMyCollectionView];
    [self setUpRightBarButtonItem];
    
    _taskVC = [[TaskDetailVC alloc] init];
}

- (void) setUpMyCollectionView {
    _myCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    [_myCollectionView setDataSource:self];
    [_myCollectionView setDelegate:self];
    [_myCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifire];
    [_myCollectionView setBackgroundColor:UIColor.lightGrayColor];
    [self.view addSubview:_myCollectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifire forIndexPath:indexPath];
    [cell setUpCell:[[self data] objectAtIndex:indexPath.row]];
    [self passDataWithCell:cell];
    
    return cell;
}

- (void) passDataWithCell:(MyCollectionViewCell *)cell {
    [[self navigationController] presentViewController:self.taskVC animated:YES completion:^{
        [self.taskVC setLabel:cell.myContentView.label];
        NSLog(@"VC %@", self.taskVC.label);
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tapped on Cell");
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (void) setUpRightBarButtonItem {
    UIButton *rightBttn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [rightBttn addTarget:self action:@selector(addNewCell:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBttnItem = [[UIBarButtonItem alloc] initWithCustomView:rightBttn];
    
    [[self navigationItem] setRightBarButtonItem:barBttnItem];
}



- (void)addNewCell:(id)sender {
    NSArray *dataForNewCell = @[@"Tap On Me"];
    ViewController *__weak weakSelf = self;
    
    [self.myCollectionView performBatchUpdates:^{
        ViewController *__strong strongSelf = weakSelf;
        NSInteger countBefore = [[strongSelf data] count];
        
        NSMutableArray *updatedData = [NSMutableArray arrayWithArray:strongSelf.data];
        [updatedData addObjectsFromArray:dataForNewCell];
        [strongSelf setData:[updatedData copy]];
        NSInteger countAfter = [[strongSelf data] count];
        NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
        
        for (NSInteger i = countBefore; i < countAfter; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];//countBefore + 1;
            [strongSelf.myCollectionView insertItemsAtIndexPaths:[indexPaths copy]];
        }
    } completion:^(BOOL finished){
        NSLog(@"did add new Cell");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
