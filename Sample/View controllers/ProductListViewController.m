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

- (void)viewDidLoad {
    [super viewDidLoad];

    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Bg.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    [self.tableView setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.activityIndicator = [[SFActivityIndicator alloc]init];
    

    // Do any additional setup after loading the view.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProductCell";

    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];

    Product *product = [self.products objectAtIndex:indexPath.row];
    cell.productName.text = product.productName;
    cell.ProductBrandName.text = product.productBrandName;
    cell.productCategoryName.text = product.productColor;
    cell.productSize.text = product.productSize;
    cell.productPrice.text = product.productPrice;
    cell.productImageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.productImageView.image = [UIImage imageNamed:product.productImage];

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0f;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)searchButtonHanduler:(id)sender {
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-10, 44.0)];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-10, 44.0)];
    _searchBar.delegate = self;
    [view addSubview:_searchBar];
    
    [_searchBar becomeFirstResponder];

    self.navigationItem.titleView = view;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [_searchBar removeFromSuperview];
    self.title = @"Products";
    WebServiceManager *webServiceManager = [[WebServiceManager alloc]init];

    [self.activityIndicator showActivityIndicator];
    __weak typeof( self ) weakSelf = self;

    NSString *searchString = [searchBar.text stringByReplacingOccurrencesOfString:@"," withString:@""];

    [webServiceManager doSearch:searchString withSuccessBlock:^(NSMutableArray * _Nonnull products) {
        weakSelf.products = products;
        [weakSelf.tableView reloadData];

        [self.activityIndicator stopActivityIndicator];
    } withFailureBlock:^(SBError * _Nonnull error) {

        UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"S-Cart"
                                                                      message:@"No product available"
                                                               preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* noButton = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        [self.activityIndicator stopActivityIndicator];
    }];
}

@end
