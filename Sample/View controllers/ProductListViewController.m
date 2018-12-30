//
//  ProductListViewController.m
//  Sample
//
//  Created by Ramesh D on 17/12/18.
//  Copyright © 2018 Ramesh D. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductTableViewCell.h"
#import "Product.h"
#import "WebServiceManager.h"
#import <AFNetworking/AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface ProductListViewController ()

@end

@implementation ProductListViewController

- ( void )viewDidLoad
{
    [super viewDidLoad];

    // Set background color and frame for tableview.
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Bg.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.tableView setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];

    // Intilaize activity indicator.
    self.activityIndicator = [[SFActivityIndicator alloc]init];
}

#pragma mark - Table view data source

/*!
 Set number of table view sections.

 @param tableView Table view instance.
 @return Number of sections.
 */
- ( NSInteger )numberOfSectionsInTableView:( UITableView * )tableView
{
    return 1;
}

/*!
 Set number of rows in particular section.

 @param tableView Table view.
 @param section Section index.
 @return Number of rows in particular section.
 */
- ( NSInteger )tableView:( UITableView * )tableView
   numberOfRowsInSection:( NSInteger )section
{
    return self.products.count;
}

/*!
 Create product table view cell.
 
 @param tableView Table view.
 @param indexPath Index path of the cell.
 @return Product table view cell.
 */
- ( UITableViewCell * )tableView:( UITableView * )tableView
           cellForRowAtIndexPath:( NSIndexPath * )indexPath
{
    // Cell identifier.
    static NSString *CellIdentifier = @"ProductCell";

    // Create product table view cell.
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];

    // Get product informations.
    Product *product = [self.products objectAtIndex:indexPath.row];

    // Set values to product table view cell.
    cell.productName.text = product.productName;
    cell.ProductBrandName.text = product.productBrandName;
    cell.productCategoryName.text = product.productColor;
    cell.productSize.text = product.productSize;
    cell.productPrice.text = product.productPrice;
    cell.productImageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.productImageView.image = [UIImage imageNamed:product.productImage];

    // TODO : Lazzy loading.
//    NSURL *url = [NSURL URLWithString:product.productImage];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    UIImage *placeholderImage = [UIImage imageNamed:@"Sample 2_0.jpg"];
//
//    __weak ProductTableViewCell *weakCell = cell;
//
//    [cell.productImageView setImageWithURLRequest:request
//                          placeholderImage:placeholderImage
//                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//
//                                       weakCell.productImageView.image = image;
//
//                                   } failure:nil];
    return cell;
}

/*!
 Set table view header height.

 @param tableView Table view.
 @param indexPath Index path of the cell.
 @return Table view header height.
 */
- ( CGFloat )tableView:( UITableView * )tableView
heightForRowAtIndexPath:( NSIndexPath * )indexPath
{
    return 150.0f;
}

/*!
 Show search bar.
 
 @param sender UIButton instance.
 */
- ( IBAction )searchButtonHanduler:( id )sender
{
    // Create search bar view.
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake( 0, 0, self.view.frame.size.width - 10, 44.0 )];
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake( 0, 0, self.view.frame.size.width - 10, 44.0 )];
    _searchBar.delegate = self;
    [view addSubview:_searchBar];
 
    // Show keyboard.
    [_searchBar becomeFirstResponder];

    // Add search bar view to navigation bar
    self.navigationItem.titleView = view;
}

/*!
 Search bar search button action.

 @param searchBar Search bar.
 */
- ( void )searchBarSearchButtonClicked:( UISearchBar * )searchBar
{
    // Dismiss keyboard and remove search view from navigation bar.
    [searchBar resignFirstResponder];
    [_searchBar removeFromSuperview];

    // Set title of the view
    self.title = @"S-Cart";

    // Create service manager.
    WebServiceManager *webServiceManager = [[WebServiceManager alloc]init];

    // Start activity indicator.
    [self.activityIndicator showActivityIndicator];

    // Avoid retain cycle.
    __weak typeof( self ) weakSelf = self;

    // Remove , in given search string.
    NSString *searchString = [searchBar.text stringByReplacingOccurrencesOfString:@"," withString:@""];

    // Get products.
    [webServiceManager doSearch:searchString withSuccessBlock:^( NSMutableArray * _Nonnull products ) {

        // Checks whether product is avilable.
        if ( products.count ) {

            // Set and reload products.
            weakSelf.products = products;
            [weakSelf.tableView reloadData];
        }
        else {

            // Show error message.
            [self showErrorMessageWithMessage:@"No products available."];
        }

        // Hide activity indicator.
        [self.activityIndicator stopActivityIndicator];
    }
    withFailureBlock:^( SBError * _Nonnull error ) {

        // Show error message and stop activity indicator.
        [self showErrorMessageWithMessage:@"No products available."];
        [self.activityIndicator stopActivityIndicator];
    }];
}

/*!
 Show error message alert.

 @param message Message to show in alert.
 */
- ( void )showErrorMessageWithMessage:( NSString * )message
{
    // Create alert view controller.
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"S-Cart"
                                                                  message:message
                                                           preferredStyle:UIAlertControllerStyleAlert];

    // Create alert view controller buttons.
    UIAlertAction* noButton = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^( UIAlertAction * action ) {

        // Dismiss alert view controller.
        [self dismissViewControllerAnimated:YES completion:nil];
    }];

    // Add alert button to alert view controller.
    [alert addAction:noButton];

    // Show alert view controller.
    [self presentViewController:alert animated:YES completion:nil];
}

@end
