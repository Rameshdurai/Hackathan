//
//  SBError.h
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBError : NSObject

@property ( nonatomic, strong ) NSString *errorCode;
@property ( nonatomic, strong ) NSString *errorDescription;

@end

NS_ASSUME_NONNULL_END
