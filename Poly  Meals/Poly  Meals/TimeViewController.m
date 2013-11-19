//
//  TimeViewController.m
//  Poly  Meals
//
//  Created by nweitz on 10/31/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import "TimeViewController.h"
#import "RestrauntViewController.h"
@interface TimeViewController ()

@property NSArray *mealTime;
@end

@implementation TimeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mealTime = @[@"Breakfast", @"Lunch", @"Dinner", @"Late Night"];
    //self.mealTime = time;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"timeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *Jenna = self.mealTime[indexPath.row];
    
    cell.textLabel.text = Jenna;
    
    
    return cell;
}

- (NSArray*)restrauntsOpen:(int )rest
{
    if(/*[rest isEqualToString:@"Breakfast"]*/ rest==0){
        return @[@"VGs",@"Sandwich Factory",@"Einstein's",@"Tacos to Go"];
    }
    else if(/*[rest isEqualToString:@"Lunch"]*/ rest==1){
        return @[@"VGs",@"Sandwich Factory",@"Einstein's",@"Tacos to Go"];
    }
    else if(/*[rest isEqualToString:@"Dinner"]*/ rest==2){
        return @[@"VGs",@"Sandwich Factory",@"Einstein's",@"Tacos to Go"];
    }
    else if(/*[rest isEqualToString:@"Late Night"]*/ rest==3){
        return @[@"VGs",@"Tacos to Go"];
    }
    else{
        return @[];
    }
}
- (NSNumber*)setTotal:(int)x
{
    if(x==0){
        return @7.90;
    }
    else if(x==1){
        return @9.00;
    }
    else if(x==2){
        return @10.75;
    }
    else if(x==3){
        return @8.75;
    }
    else{
        return @0;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"Time-RestrauntsSegue"]){
        RestrauntViewController *restObj = segue.destinationViewController;
        NSIndexPath *restPath = self.tableView.indexPathForSelectedRow;
        NSNumber *i = [self setTotal:restPath.row];
        NSArray *open = [self restrauntsOpen: restPath.row];
        restObj.places = open;
        restObj.tot = i;
    }
}



@end
