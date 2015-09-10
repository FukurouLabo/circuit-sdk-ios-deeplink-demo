// CircuitDeeplinkingSupporter-1.3.0

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

/**
 * Class for CircuitDeeplinkSupporter.
 */
@interface CircuitDeepLink : NSObject

extern NSString *circuitSDKVersion;
extern BOOL CDL_ENABLED_OUTPUT_LOGGING; // MEMO: 生config, エラーログの出力を有効にするフラグ
extern BOOL CDL_ENABLED_NO_CACHE_RESOURCE; // MEMO: apiのレスのキャッシュを無効にするフラグ

/**
 * Instance of CircuitDeepLink.
 *
 * @return CircuitDeepLink class.
 *
 */
+ (id)sharedInstance;

/**
 * Register the handler to move in after the processing of Deeplink.
 */
- (void)registerHandlerWithName:(NSString *)handlerName handler:(void (^)(NSDictionary *))handlerFunction;
- (void)registerHandlerWithNameAndContinue:(NSString *)handlerName handler:(BOOL (^)(NSDictionary *))handlerFunction;

/**
 * It will parse to process the deeplink.
 */
- (void)routeUsingUrl:(NSURL *)deeplink;

/**
 * Set a ApplicationId for CircuitDeeplinkSupporter.
 */
- (void)setAppId:(NSString *)appId;

/**
 * Set a ApplicationId with callback for CircuitDeeplinkSupporter.
 */
- (void)setAppId:(NSString*)appId callback:(void (^)(NSError *error))block;
- (NSURL*)getMostRecentDeeplink;

/**
 * Enable the developmentMode.
 *
 * - To disable caching of response.
 * - Output the log for debugging.
 *
 */
- (void)setDevelopmentMode:(BOOL)enabled;

/**
 * Output the log for debugging.
 */
- (void)setLogEnabled:(BOOL)enabled;

/**
 * To disable caching of response.
 */
- (void)setEnabledNoCacheResource:(BOOL)enabled;

/**
 * Will not use.
 */
- (BOOL)isLogEnabled;
/**
 * Will not use.
 */
- (BOOL)isEnabledOutputLogging;
/**
 * Will not use.
 */
- (BOOL)isEnabledNoCacheResource;

@end
