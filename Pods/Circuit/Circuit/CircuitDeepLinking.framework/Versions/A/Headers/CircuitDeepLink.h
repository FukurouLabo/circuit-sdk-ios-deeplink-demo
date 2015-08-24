// CircuitDeeplinkingSupporter-1.2.2

// Copyright 2015 FukurouLabo
// http://fukurou-labo.co.jp/
//
// MobileDeepLinking
// Copyright 2015 MobileDeepLinking.org
// Released under the BSD license
// http://mobiledeeplinking.org/
//
// Date: 2015-04-13

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CircuitDirect.h"
#import "CircuitDirectResponseModel.h"

@interface CircuitDeepLink : NSObject

extern BOOL CDL_ENABLED_OUTPUT_LOGGING; // MEMO: 生config, エラーログの出力を有効にするフラグ
extern BOOL CDL_ENABLED_NO_CACHE_RESOURCE; // MEMO: apiのレスのキャッシュを無効にするフラグ

+ (id)sharedInstance;
- (void)registerHandlerWithName:(NSString *)handlerName handler:(void (^)(NSDictionary *))handlerFunction;
- (void)routeUsingUrl:(NSURL *)deeplink;
- (void)setAppId:(NSString *)appId;
- (void)setAppId:(NSString*)appId callback:(void (^)(NSError *error))block;
- (void)setDevelopmentMode:(BOOL)enabled;

- (void)setLogEnabled:(BOOL)enabled;
- (void)setEnabledNoCacheResource:(BOOL)enabled;
- (BOOL)isLogEnabled;
- (BOOL)isEnabledOutputLogging;
- (BOOL)isEnabledNoCacheResource;

@end
