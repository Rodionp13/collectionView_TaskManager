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
    [backBttn setCenter:[[self view] center]];
    [backBttn setBackgroundColor:UIColor.greenColor];
    [backBttn setTitle:@"back" forState:UIControlStateNormal];
    [backBttn addTarget:self action:@selector(dismissTasckDetailVC:) forControlEvents:UIControlEventTouchUpInside];
    
    [[self view] addSubview:backBttn];
    NSLog(@"Task %@", self.label.text);
}


- (void) dismissTasckDetailVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"OK");
    }];
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
