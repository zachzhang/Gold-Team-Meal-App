//
//  MenuTableViewController.m
//  Poly  Meals
//
//  Created by Noah Weitz on 11/3/13.
//  Copyright (c) 2013 Gold Team. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuTableCell.h"
#import "Parse/Parse.h"
@interface MenuTableViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *totalLabel;
@property NSArray *allItems;
@property double totalCost;
@end

@implementation MenuTableViewController

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
    NSString *name = self.subName;
    PFQuery *query = [PFQuery queryWithClassName:@"allData"];
    [query whereKey:@"subRestaurant" equalTo:name];
    [query findObjectsInBackgroundWithTarget:self
                                    selector:@selector(saveParseArr:error:)];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) saveParseArr: (NSArray*) foodItems error: (NSError*)error
{
    if (!error)
        self.allItems = foodItems;
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)index
{
    MenuTableCell *cell = [tableView cellForRowAtIndexPath:index];
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
    double d = [[nf numberFromString: cell.foodPrice.text] doubleValue];
    self.totalCost += d;
    NSString *dollar = @"$";
    self.totalLabel.title = [dollar stringByAppendingString:[NSString stringWithFormat:@"%.2f", self.totalCost]];
    NSNumber *quant = @([cell.quantity.text intValue] + 1);
    cell.quantity.text = [quant stringValue];
    
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
    return self.allItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"menuItem";
    MenuTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *priceLabel = @"$";
    
    // Configure the cell...
    NSString *quant = [NSString stringWithFormat:@"0"];
    cell.foodName.text = self.allItems[indexPath.row][@"foodName"];
    cell.foodPrice.text = [priceLabel stringByAppendingString: [self.allItems[indexPath.row][@"foodPrice"] stringValue]];
    cell.quantity.text = quant;
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
