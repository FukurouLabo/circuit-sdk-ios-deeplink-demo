//
//  CartTableViewController.m
//  demoapp
//
//  Created by shota on 2015/04/28.
//  Copyright (c) 2015年 fukurou-labo. All rights reserved.
//

#import "CartTableViewController.h"

@interface CartTableViewController ()

@end

@implementation CartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.allowsSelection = NO;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *items = [ud dictionaryForKey:@"items"];
    NSDictionary *cartItems = [ud dictionaryForKey:@"cartItems"];

    //cartItemsをUITableViewで読み込めるように変換
    NSMutableArray *arrayCartItems = [self getArrayData:cartItems];
    
    /*
    //cartItemsをUITableViewで読み込めるように変換
    NSMutableArray *arrayCartItems = [NSMutableArray array];
    for (NSDictionary *cartItemId in cartItems)
    {
        NSMutableDictionary *cartItem = [NSMutableDictionary dictionary];
        [cartItem setObject:cartItemId forKey:@"itemId"];
        [cartItem setObject:[cartItems objectForKey:cartItemId] forKey:@"quantity"];
        
        [arrayCartItems addObject:cartItem];
    }
    */
     
    self.items = items;
    self.arrayCartItem = arrayCartItems;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.arrayCartItem count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    
    int rowNum = (int)indexPath.row;
    NSDictionary *cartItem = [self.arrayCartItem objectAtIndex:rowNum];
    
    NSString *cartItemId = [cartItem objectForKey:@"itemId"];
    NSString *cartItemQuantity = [cartItem objectForKey:@"quantity"];
    NSDictionary *item = [self.items objectForKey:cartItemId];
    
    cell.textLabel.text = [item objectForKey:@"name"];
    NSString *price = [item objectForKey:@"price"];
    
    // 商品ごとの合計金額
    int totalPrice = price.intValue * cartItemQuantity.intValue;
    cell.detailTextLabel.text = [self getTotalPrice:price quantity:cartItemQuantity totalPrice:totalPrice];
    
    // NavigationBarのTitleに合計金額を表示
    [self viewAllItemsTotalPriceTitle:totalPrice rowNum:rowNum];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSMutableArray *)getArrayData:(NSDictionary *)cartItems {
    
    NSMutableArray *arrayCartItems = [NSMutableArray array];
    for (NSDictionary *cartItemId in cartItems)
    {
        NSMutableDictionary *cartItem = [NSMutableDictionary dictionary];
        [cartItem setObject:cartItemId forKey:@"itemId"];
        [cartItem setObject:[cartItems objectForKey:cartItemId] forKey:@"quantity"];
        
        [arrayCartItems addObject:cartItem];
    }
    return arrayCartItems;
}

- (NSString *)getTotalPrice:(NSString *)price quantity:(NSString *)quantity totalPrice:(int)totalPrice {
    
    return [NSString stringWithFormat:@"%d円(%@円×%@個)", totalPrice, price, quantity];
}

- (void)viewAllItemsTotalPriceTitle:(int)totalPrice rowNum:(int)rowNum {
    
    self.allItemsTotalPrice = self.allItemsTotalPrice + totalPrice;
    if (rowNum == [self.arrayCartItem count] - 1)
    {
        self.allItemsTotalPriceTitle.title = [NSString stringWithFormat:@"カート(合計%d円)", self.allItemsTotalPrice];
    }
}

- (IBAction)pushBuyButton:(id)sender {
    
    // Thanksページの表示
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThanksViewController *thanksViewController = [storyboard instantiateViewControllerWithIdentifier:@"thanksViewController"];
    [self presentViewController:thanksViewController animated:YES completion:nil];
    
    // Thanksページを閉じた際に、トップページに戻っているようにする
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)pushToTopPage:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
