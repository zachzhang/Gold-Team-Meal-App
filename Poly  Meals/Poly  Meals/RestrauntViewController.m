//
//  RestrauntViewController.m
//  Poly  Meals
//
//  Created by zach zhang on 11/12/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import "RestrauntViewController.h"
#import "SubRestrauntViewController.h"
@interface RestrauntViewController ()
@property NSArray *restProp;


@end

@implementation RestrauntViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *rest = self.places;
    self.restProp = rest;
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (NSArray*)subrestraunt:(int )rest
{
    if(/*[rest isEqualToString:@"Breakfast"]*/ rest==0){
        return @[@"Drinks",@"Grab & Go",@"Salad Bar",@"Bella Pasta",@"Cagie Moons",@"Chopstix",@"Sandwich Stop"];
    }
    else if(/*[rest isEqualToString:@"Lunch"]*/ rest==1){
        return @[@"Sandwich Factory"];
    }
    else if(/*[rest isEqualToString:@"Dinner"]*/ rest==2){
        return @[@"Hot Beverages",@"Cold Beverages",@"Sweets",@"Soup",@"Lighter Side",@"Lunch Creation",@"Specialty Sandwichs",@"Breakfast"];
    }
    else if(/*[rest isEqualToString:@"Late Night"]*/ rest==3){
        return @[@"Tacos to Go"];
    }
    else{
        return @[];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RestrauntCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSArray *local = self.places;
    cell.textLabel.text = local[indexPath.row];
    
    // Configure the cell...
    
    return cell;
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
    if([segue.identifier isEqualToString:@"Restraunt-SubRestraunt"]){
        SubRestrauntViewController *restObj = segue.destinationViewController;
        NSIndexPath *restPath = self.tableView.indexPathForSelectedRow;
        NSNumber *num = self.tot;
        NSArray *open = [self subrestraunt: restPath.row];
        restObj.sub = open;
        restObj.tot = num;
        
    }
        
}



@end
