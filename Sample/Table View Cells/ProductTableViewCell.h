//
//  ProductTableViewCell.h
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *ProductBrandName;
@property (weak, nonatomic) IBOutlet UILabel *productCategoryName;
@property (weak, nonatomic) IBOutlet UILabel *productSize;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;

@end

NS_ASSUME_NONNULL_END
