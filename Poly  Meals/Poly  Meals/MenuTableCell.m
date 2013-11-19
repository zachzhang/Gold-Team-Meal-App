//
//  MenuTableCell.m
//  Poly  Meals
//
//  Created by Noah Weitz on 11/3/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import "MenuTableCell.h"
@interface MenuTableCell();

@end
@implementation MenuTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
