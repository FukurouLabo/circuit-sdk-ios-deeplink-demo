//
//  ThanksViewController.m
//  demoapp
//
//  Created by shota on 2015/04/30.
//  Copyright (c) 2015年 fukurou-labo. All rights reserved.
//

#import "ThanksViewController.h"

@interface ThanksViewController ()

@end

@implementation ThanksViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //カートから商品を削除
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *cartItems = [[NSDictionary alloc] init];
    [ud setObject:cartItems forKey:@"cartItems"];
    
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

- (IBAction)pushToTopPageButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
