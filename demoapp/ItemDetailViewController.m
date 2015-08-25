//
//  ItemDetailViewController.m
//  demoapp
//
//  Created by shota on 2015/04/28.
//  Copyright (c) 2015年 fukurou-labo. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "CartTableViewController.h"
#import <CircuitDeepLinking/CircuitDeepLink.h>

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *item = [self getItem];
    
    // itemが見つからない場合は商品一覧ページに遷移
    if (item == nil)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    self.itemName.text = [item objectForKey:@"name"];
    self.itemPrice.text = [NSString stringWithFormat:@"%@円", [item objectForKey:@"price"]];
    self.itemImageView.image = [UIImage imageNamed:[item objectForKey:@"img"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"addCart"]) {
        [self addCart];
    }
}

- (NSDictionary *)getItem {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *items = [ud dictionaryForKey:@"items"];
    
    // Circuitディープリンクサポーターで取得したCDSitemIdを使用
    if (self.CDSitemId != nil)
    {
        self.itemId = self.CDSitemId;
    }
    
    return [items objectForKey:self.itemId];
}

- (void)addCart {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *cartItems = [[ud objectForKey:@"cartItems"] mutableCopy];
    NSNumber *cartItemQuantity = [cartItems objectForKey:self.itemId];
    int intCartItemQuantity = cartItemQuantity.intValue;
    if (intCartItemQuantity == 0) {
        intCartItemQuantity = 1;
    } else {
        intCartItemQuantity ++;
    }
    [cartItems setValue:[NSNumber numberWithInt:intCartItemQuantity] forKey:self.itemId];
    [ud setObject:cartItems forKey:@"cartItems"];
}
    
@end
