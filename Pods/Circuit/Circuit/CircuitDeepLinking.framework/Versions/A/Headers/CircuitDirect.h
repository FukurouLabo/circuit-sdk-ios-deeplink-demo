#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <AdSupport/AdSupport.h>
#import <CommonCrypto/CommonCrypto.h>
#import "CircuitDirectResponseModel.h"

typedef void (^completionBlock)(NSError *error);

@interface CircuitDirect : NSObject

+ (CircuitDirect *)setAppId:(NSString *)appId;
+ (CircuitDirect *)setAppId:(NSString *)appId callback:(void (^)(NSError *error))block;
+ (void)setCircuitDirectParams:(NSString*)params;
+ (CircuitDirectResponseModel*)getCircuitDirectResponseModel;

@end
