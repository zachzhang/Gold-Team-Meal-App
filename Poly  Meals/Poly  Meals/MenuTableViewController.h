//
//  MenuTableViewController.h
//  Poly  Meals
//
//  Created by Noah Weitz on 11/3/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedViewController.h"

@interface MenuTableViewController : UITableViewController 
@property NSString *subName;
@property NSNumber *total;
@property NSMutableArray *cart;
@end