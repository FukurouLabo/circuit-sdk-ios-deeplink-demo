//
//  AppDelegate.m
//  demoapp
//
//  Created by shota on 2015/04/28.
//  Copyright (c) 2015年 fukurou-labo. All rights reserved.
//

#import "AppDelegate.h"
#import <CircuitDeepLinking/CircuitDeepLink.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 開発モードのON/OFF設定
    [[CircuitDeepLink sharedInstance] setLogEnabled:YES];
    
    // SDK読み込み用のコード(CDS)
    [[CircuitDeepLink sharedInstance] setAppId:@"a0000063489"];
    
    // 遷移前に実行するアクション(CDS)
    // 返り値がYESの場合、遷移は行わず、NOの場合は遷移を行う
    [[CircuitDeepLink sharedInstance] registerHandlerWithNameAndContinue:@"beforeMoveItemDetail" handler:^BOOL(NSDictionary *params) {
        NSLog(@"beforeMoveItemDetail");
        
        return NO;
    }];
    [self initData];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initData {
    //商品リスト(json)をNSUserDefaultに書き込む
    [self saveJson];
    
    //カート情報がNSUserDefaultに保存されていない場合
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([ud dictionaryForKey:@"cartItems"] == nil)
    {
        NSDictionary *cartItems = [[NSDictionary alloc] init];
        [ud setObject:cartItems forKey:@"cartItems"];
    }
}

- (void)saveJson {
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"Items" ofType:@"json"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:jsonFilePath]) // ファイルの存在チェック
    {
        NSLog(@"No File (Items.json)");
        return;
    }
    
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
    
    NSError *error;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if (ud == nil)
    {
        NSLog(@"Uncorrect File (Items.json)");
        return;
    }
    [ud setObject:jsonObject forKey:@"items"];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    // ディープリンクでアプリ起動した際の処理(CDS)
    [[CircuitDeepLink sharedInstance] routeUsingUrl:url];
    return YES;
}

@end
