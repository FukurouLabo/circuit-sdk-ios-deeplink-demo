#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <AdSupport/AdSupport.h>
#import <CommonCrypto/CommonCrypto.h>
#import "CircuitDirectResponseModel.h"

typedef void (^completionBlock)(NSError *error);

/**
 * class for CircuitDirect
 */
@interface CircuitDirect : NSObject

/**
 * Set a applicationId for CircuitDirect.
 *
 * @param appId ApplicationId that can be retrieved from the management screen.
 *
 * @return CircuitDirect Instance.
 *
 */
+ (CircuitDirect *)setAppId:(NSString *)appId;

/**
 * Set a applicationId with callback after communication for CircuitDirect.
 *
 * @param appId ApplicationId that can be retrieved from the management screen.
 * @param callback Callback called after the communication processing.
 *
 * @return CircuitDirect Instance.
 *
 */
+ (CircuitDirect *)setAppId:(NSString *)appId callback:(void (^)(NSError *error))block;

/**
 * To obtain information model of CircuitDirect.
 *
 * @return class of CircuitDirectResponseModel.
 */
+ (CircuitDirectResponseModel*)getCircuitDirectResponseModel;
+ (BOOL)clearCircuitDirectResponseModel;

/**
 * will not use.
 */
+ (void)setCircuitDirectParams:(NSString*)params;

@end
