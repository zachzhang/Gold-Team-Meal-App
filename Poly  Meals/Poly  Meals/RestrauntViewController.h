//
//  RestrauntViewController.h
//  Poly  Meals
//
//  Created by zach zhang on 11/12/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestrauntViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITableViewCell *restrauntLabel;
@property NSArray *places;
@property NSNumber *tot;
@end
