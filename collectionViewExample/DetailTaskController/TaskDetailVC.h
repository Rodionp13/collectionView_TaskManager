//
//  TaskDetailVC.h
//  collectionViewExample
//
//  Created by User on 7/5/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TaskDetailVCDelegate
- (void) presentCollectionVCWithUpdatedDataSource:(NSArray *)updatedDataSource withPresentedIndexPath:(NSIndexPath *)presentedIndexPath;
@end


@interface TaskDetailVC : UIViewController
@property(nonatomic, strong) UITextField *textForTitle;
@property(nonatomic, strong) UITextField *textForDescription;
@property(nonatomic, strong) UITextView *textViewForDescription;
@property(nonatomic, strong) NSArray *collectionViewDataSource;
@property(nonatomic ,strong) NSIndexPath *presentedIndexPath;

@property(nonatomic, weak) id <TaskDetailVCDelegate> delegate;
@end
