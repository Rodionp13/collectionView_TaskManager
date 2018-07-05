//
//  ViewController.h
//  collectionViewExample
//
//  Created by User on 7/4/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskDetailVC.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic,  strong) NSArray *data;
@property(nonatomic, strong) UICollectionView *myCollectionView;
@property(nonatomic, strong) TaskDetailVC *taskVC;

@end

