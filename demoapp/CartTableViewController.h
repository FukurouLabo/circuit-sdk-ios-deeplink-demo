//
//  CartTableViewController.h
//  demoapp
//
//  Created by shota on 2015/04/28.
//  Copyright (c) 2015年 fukurou-labo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThanksViewController.h"

@interface CartTableViewController : UITableViewController

@property NSDictionary *items;
@property NSArray *arrayCartItem;
@property int allItemsTotalPrice;

@property (weak, nonatomic) IBOutlet UINavigationItem *allItemsTotalPriceTitle;

- (IBAction)pushBuyButton:(id)sender;
- (IBAction)pushToTopPage:(id)sender;

@end
