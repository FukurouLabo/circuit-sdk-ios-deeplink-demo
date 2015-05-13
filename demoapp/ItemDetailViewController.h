//
//  ItemDetailViewController.h
//  demoapp
//
//  Created by shota on 2015/04/28.
//  Copyright (c) 2015年 fukurou-labo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailViewController : UIViewController

@property NSString *itemId;

@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

// ディープリンク内のクエリパラメータ(CDS)
@property(nonatomic, strong) id CDSitemId;
@end
