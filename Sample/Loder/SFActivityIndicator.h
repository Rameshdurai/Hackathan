//
//  SFActivityIndicator.h
//  Smart Parking
//
//  Created by Ramesh on 30/03/17.
//  Copyright © 2017 Aspire Syatems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGActivityIndicatorView.h"


@interface SFActivityIndicator : NSObject

@property ( nonatomic, strong ) DGActivityIndicatorView *activityIndicatorView;

@property ( nonatomic, strong ) UIView *indicator;

- ( void )showActivityIndicator;

- ( void ) stopActivityIndicator;

@end
