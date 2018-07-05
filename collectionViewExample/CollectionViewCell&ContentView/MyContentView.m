//
//  MyContentView.m
//  collectionViewExample
//
//  Created by User on 7/5/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import "MyContentView.h"

@implementation MyContentView

- (id)initMyContentViewWith:(CGRect)labelRect :(NSString *)labelText {
    self = [super init];
    
    if(self)
    {
        _label = [[UILabel alloc] initWithFrame:labelRect];
        [_label setText:labelText];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_label];
        _taskDeskription = [[UITextView alloc] init];
        [self addSubview:_taskDeskription];
    }
    return self;
}

@end
