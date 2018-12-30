//
//  WebServiceManager.m
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import "WebServiceManager.h"
#import "Product.h"
#import "SBError.h"
#import "ProductParser.h"
#import "AFNetworking.h"

@implementation WebServiceManager

- ( void )doSearch:( NSString * )searchKeyword
 withSuccessBlock :(ProductListResponse)success
  withFailureBlock:(WebServiceFailureResponse) failure
{
    NSString *urlString = [NSString stringWithFormat:@"https://vnexttest.aspiresys.com/RetailApi/api/Values?text=%@",searchKeyword];
    
    NSString* encodedUrl = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSURL *URL = [NSURL URLWithString:encodedUrl];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {

        NSMutableArray *products = [ProductParser parseProducts:(NSDictionary *)responseObject];
        success(products);
    } failure:^(NSURLSessionTask *operation, NSError *error) {

        SBError *error1 = [[SBError alloc]init];
        error1.errorDescription = [error localizedDescription];
        failure(error1);
    }];
}

@end
