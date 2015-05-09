//
//  MainTableViewController.h
//  demoapp
//
//  Created by shota on 2015/04/28.
//  Copyright (c) 2015年 fukurou-labo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewController.h"

@interface MainTableViewController : UITableViewController

@property NSDictionary *items;
- (IBAction)pushToSettingPage:(id)sender;

@end
