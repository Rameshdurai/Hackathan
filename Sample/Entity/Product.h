//
//  Product.h
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject

@property ( nonatomic, strong ) NSString *productID;
@property ( nonatomic, strong ) NSString *productName;
@property ( nonatomic, strong ) NSString *productBrandName;
@property ( nonatomic, strong ) NSString *productPrice;
@property ( nonatomic, strong ) NSString *productColor;
@property ( nonatomic, strong ) NSString *productCategoryName;
@property ( nonatomic, strong ) NSString *productRating;
@property ( nonatomic, strong ) NSString *productSize;
@property ( nonatomic, strong ) NSString *productWarranty;
@property ( nonatomic, strong ) NSString *productSpecification;
@property ( nonatomic, strong ) NSString *productImage;

@end

NS_ASSUME_NONNULL_END
