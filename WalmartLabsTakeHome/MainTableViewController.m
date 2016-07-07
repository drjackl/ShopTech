//
//  MainTableViewController.m
//  WalmartLabsTakeHome
//
//  Created by Jack Li on 7/2/16.
//  Copyright © 2016 Jack Li. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"
#import "DetailsViewController.h"
#import "DataSource.h"
#import "Product.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // These two lines needed for packing row height
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated. Test commit
}

#pragma mark - Table view data source

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [DataSource sharedInstance].products.count;
}


- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {

    MainTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"productCellCustom" forIndexPath:indexPath];
    
    // Configure the cell...
    Product* product = [DataSource sharedInstance].products[indexPath.row];
    
    cell.product = product;
    
    return cell;
}

- (void) scrollViewDidScroll:(UIScrollView*)scrollView {
    NSIndexPath* bottomIndexPath = [[self.tableView indexPathsForVisibleRows] lastObject];
    
    if (bottomIndexPath && bottomIndexPath.row == [DataSource sharedInstance].products.count - 1) {
        [[DataSource sharedInstance] loadNextBatch];
        [self.tableView reloadData];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showDetailsCustom"]) {
        NSIndexPath* selectedIndexPath = [self.tableView indexPathForSelectedRow];
        ((DetailsViewController*)segue.destinationViewController).product = [DataSource sharedInstance].products[selectedIndexPath.row];
    }
}


@end
