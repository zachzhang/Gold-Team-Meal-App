//
//  MenuTableCell.h
//  Poly  Meals
//
//  Created by Noah Weitz on 11/3/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *quantity;
@property (weak, nonatomic) IBOutlet UILabel *foodPrice;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@end
