//
//  CircuitDirectResponseModel.h
//  CircuitDeepLinking
//
//  Created by 油井大輔 on 2015/06/11.
//  Copyright (c) 2015年 fukurou-labo.co.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CircuitDirectResponseModel : NSObject

@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) NSString *directLinkName;
@property (nonatomic, retain) NSString *deferredDeeplink;
@property (nonatomic, retain) NSString *deferredType;
@property (nonatomic, retain) NSArray *labels;
@property (nonatomic, retain) NSDictionary *directLinkQueryStrings;

@property BOOL hasError;
@property (nonatomic, retain) NSString *errorStatus;
@property (nonatomic, retain) NSString *errorMessage;

-(instancetype)initWithNSDictionary:(NSDictionary*)dict;
-(BOOL)isImmediatelyDeeplink;
-(void)dumper;

@end
