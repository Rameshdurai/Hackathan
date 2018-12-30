//
//  WebServiceManager.h
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBError.h"
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^WebServiceFailureResponse)( SBError *error );
typedef void (^ProductListResponse)( NSMutableArray *products );

@interface WebServiceManager : NSObject

- ( void )doSearch:( NSString * )searchKeyword
 withSuccessBlock :(ProductListResponse)success
  withFailureBlock:(WebServiceFailureResponse) failure;

@end

NS_ASSUME_NONNULL_END
