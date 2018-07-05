//
//  TaskDetailVC.m
//  collectionViewExample
//
//  Created by User on 7/5/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import "TaskDetailVC.h"

@interface TaskDetailVC ()

@end

@implementation TaskDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setView:[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds]];
    UIButton *backBttn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBttn setFrame:CGRectMake(0, 0, 100, 40)];
    [backBttn setCenter:CGPointMake([[self view] center].x, [[self view] center].y + [[self view] bounds].size.height / 4)];
    [backBttn setBackgroundColor:UIColor.greenColor];
    [backBttn setTitle:@"back" forState:UIControlStateNormal];
    [backBttn addTarget:self action:@selector(dismissTasckDetailVC:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:backBttn];
    
    _textForTitle = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 50)];
    [_textForTitle setCenter:CGPointMake([[self view] center].x, 100)];
    [[_textForTitle layer] setBorderWidth:1];
    [[_textForTitle layer] setCornerRadius:15];
    [[_textForTitle layer] setBorderColor:UIColor.lightGrayColor.CGColor];
    [_textForTitle setText:[[self collectionViewDataSource] objectAtIndex:[self presentedIndexPath].row][0]];
    [[self view] addSubview:_textForTitle];
    
    _textForDescription = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 50)];
    [_textForDescription setCenter:CGPointMake([[self view] center].x, 170)];
    [[_textForDescription layer] setBorderWidth:3];
    [[_textForDescription layer] setCornerRadius:15];
    [[_textForDescription layer] setBorderColor:UIColor.lightGrayColor.CGColor];
    [_textForDescription setText:[[self collectionViewDataSource] objectAtIndex:[self presentedIndexPath].row][1]];
    [[self view] addSubview:_textForDescription];
    
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(250, 200)];
    _textViewForDescription = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 250, 200) textContainer:textContainer];
    [_textViewForDescription setCenter:CGPointMake([[self view] center].x, [[self view] center].y)];
    [[_textViewForDescription layer] setBorderWidth:3];
    [[_textViewForDescription layer] setBorderColor:UIColor.lightGrayColor.CGColor];
    [[self view] addSubview:_textViewForDescription];
    
}


- (void) dismissTasckDetailVC:(id)sender {
    [self updateCollectionViewDataSource];
    [[self delegate] presentCollectionVCWithUpdatedDataSource:[self collectionViewDataSource] withPresentedIndexPath:[self presentedIndexPath]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) updateCollectionViewDataSource {
    NSString *textForTitle = [[self textForTitle] text];
    NSString *textForDescription = [[self textForDescription] text];
    NSMutableArray *mutCopyData = [[self collectionViewDataSource] mutableCopy];
//    [mutCopyData removeObjectAtIndex:[self presentedIndexPath].row];
//    [mutCopyData insertObject:@[textForTitle, textForDescription] atIndex:[self presentedIndexPath].row];
    [mutCopyData removeObjectAtIndex:0];
    [mutCopyData insertObject:@[textForTitle, textForDescription] atIndex:0];
    
    [self setCollectionViewDataSource:[mutCopyData copy]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
