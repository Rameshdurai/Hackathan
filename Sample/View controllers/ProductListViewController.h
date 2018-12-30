//
//  ProductListViewController.h
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFActivityIndicator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductListViewController : UIViewController <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property ( nonatomic, strong ) NSMutableArray *products;
@property ( nonatomic, strong ) UISearchBar *searchBar;
@property ( nonatomic, strong ) SFActivityIndicator *activityIndicator;

- (IBAction)searchButtonHanduler:(id)sender;

@end

NS_ASSUME_NONNULL_END
