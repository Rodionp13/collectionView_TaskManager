//
//  MyContentView.h
//  collectionViewExample
//
//  Created by User on 7/5/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyContentView : UIView
@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) UITextView *taskDeskription;

- (id)initMyContentViewWith:(CGRect)labelRect :(NSString *)labelText;
@end
