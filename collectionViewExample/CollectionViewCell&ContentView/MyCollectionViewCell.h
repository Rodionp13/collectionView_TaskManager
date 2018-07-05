//
//  MyCollectionViewCell.h
//  collectionViewExample
//
//  Created by User on 7/5/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyContentView.h"

@interface MyCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong) MyContentView *myContentView;

- (void) setUpCellWithLabelText:(NSString *)labelText textViewText:(NSString *)textViewText;
@end
