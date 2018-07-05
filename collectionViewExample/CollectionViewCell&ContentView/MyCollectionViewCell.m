//
//  MyCollectionViewCell.m
//  collectionViewExample
//
//  Created by User on 7/5/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "MyContentView.h"

@implementation MyCollectionViewCell

- (void) setUpCellWithLabelText:(NSString *)labelText textViewText:(NSString *)textViewText {
    [[self layer] setBorderWidth:5];
    [[self layer] setBorderColor:UIColor.greenColor.CGColor];
    _myContentView = [[MyContentView alloc] initMyContentViewWith:[[self contentView] bounds] :labelText :textViewText];
    
    [self addSubview:_myContentView];
}
@end
