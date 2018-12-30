//
//  ProductParser.h
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductParser : NSObject

+ (NSMutableArray *)parseProducts :(NSDictionary *)response;

@end

NS_ASSUME_NONNULL_END
