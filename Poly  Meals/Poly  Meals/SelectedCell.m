//
//  SelectedCell.m
//  Poly  Meals
//
//  Created by Brian Gouldsberry on 11/19/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import "SelectedCell.h"

@implementation SelectedCell

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
