//
//  ItemTableView.m
//  Poly  Meals
//
//  Created by Noah Weitz on 11/5/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import "ItemTableView.h"

@implementation ItemTableView

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
