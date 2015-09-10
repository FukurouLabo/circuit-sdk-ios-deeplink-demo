//
//  CircuitDirectResponseModel.h
//  CircuitDeepLinking
//
//  Copyright (c) 2015年 fukurou-labo.co.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * To obtain information model of CircuitDirect.
 */
@interface CircuitDirectResponseModel : NSObject

/**
 * The user who hit is the token of the conditions that has passed through
 */
@property (nonatomic, retain) NSString *token;
/**
 * The name of the hit condition.
 */
@property (nonatomic, retain) NSString *directLinkName;
/**
 * It is a transition destination of deep link apps.
 */
@property (nonatomic, retain) NSString *deferredDeeplink;
/**
 * Type of deferredDeeplink action.
 */
@property (nonatomic, retain) NSString *deferredType;
/**
 * List of segment names
 */
@property (nonatomic, retain) NSArray *labels;
/**
 * Content of Query Strings.
 */
@property (nonatomic, retain) NSDictionary *directLinkQueryStrings;

/**
 * If it true. It will have something error.
 */
@property BOOL hasError;
/**
 * Status string of error.
 */
@property (nonatomic, retain) NSString *errorStatus;
/**
 * Error message string of error.
 */
@property (nonatomic, retain) NSString *errorMessage;

/**
 * Initializer for CircuitDirectResponseModel class.
 */
-(instancetype)initWithNSDictionary:(NSDictionary*)dict;

/**
 * will not use.
 */
-(BOOL)isImmediatelyDeeplink;

/**
 * dump CircuitDirectResponseModel.
 * @warning This method works if development mode is YES
 */
-(void)dumper;

@end
