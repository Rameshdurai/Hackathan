//
//  SFActivityIndicator.m
//  Smart Parking
//
//  Created by Ramesh on 30/03/17.
//  Copyright © 2017 Aspire Syatems. All rights reserved.
//

#import "SFActivityIndicator.h"
#import <UIKit/UIKit.h>
#import "DGActivityIndicatorView.h"
#import "AppDelegate.h"


@implementation SFActivityIndicator


- ( void )showActivityIndicator
{
    AppDelegate *delegate = (AppDelegate *) [[ UIApplication sharedApplication]delegate];
    
    self.indicator = [[UIView alloc]initWithFrame:CGRectMake(delegate.window.frame.origin.x, delegate.window.frame.origin.y, delegate.window.frame.size.width, delegate.window.frame.size.height)];
    
    UIGraphicsBeginImageContext(delegate.window.frame.size);
    [[UIImage imageNamed:@"Bg.png"] drawInRect:delegate.window.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.indicator.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.indicator.alpha = 0.9;
    
    self.activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeCookieTerminator tintColor:[UIColor whiteColor] size:40.0f];
    self.activityIndicatorView.frame = CGRectMake((delegate.window.frame.size.width/2)-25, (delegate.window.frame.size.height/2)-25, 50.0f, 50.0f);
    
    [delegate.window addSubview:self.indicator];
    
    [self.indicator addSubview:self.activityIndicatorView];
    
    [self.activityIndicatorView startAnimating];
}

- ( void ) stopActivityIndicator
{
    [self.activityIndicatorView stopAnimating];
    [self.indicator removeFromSuperview];
    
}

@end
