//
//  ProductParser.m
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import "ProductParser.h"
#import "Product.h"

@implementation ProductParser

+ (NSMutableArray *)parseProducts :(NSDictionary *)response
{
    NSMutableArray *products = [[NSMutableArray alloc]init];

    if (response)
    {
        for (NSDictionary *dict in response)
        {
            Product *product = [[Product alloc]init];
            product.productID = [NSString stringWithFormat:@"%@",dict[@"ProductID"]];;
            product.productName = dict[@"Name"];
            product.productPrice = [NSString stringWithFormat:@"$%@",dict[@"Price"]];
            product.productBrandName = [NSString stringWithFormat:@"%@",dict[@"Brand_ID"]];
            product.productCategoryName = [NSString stringWithFormat:@"%@",dict[@"Category_ID"]];
            product.productRating = [NSString stringWithFormat:@"%@",dict[@"Rating"]];
            product.productSize = [NSString stringWithFormat:@"Size:%@",dict[@"Size"]];
            product.productWarranty = dict[@"Warranty"];
            product.productSpecification = dict[@"Specification"];
            product.productImage = dict[@"ImageName"];
            product.productColor = [NSString stringWithFormat:@"%@",dict[@"Color"]];

            [products addObject:product];
        }
    }
    return products;
}

@end
