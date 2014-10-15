//
//  TableViewController.m
//  BlogReader
//
//  Created by A658308 on 10/14/14.
//  Copyright (c) 2014 Joe Susnick Co. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

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
    
//    self.blogPosts = [NSArray arrayWithObjects:
//                   @"How to stay up all night developing",
//                   @"Coffee, King of the Beans",
//                   @"Night Terrors, Real and Imagined",
//                   @"The Legend of Subway Jones",
//                   @"How to be Nice to Everyone",
//                   @"Don't Force the Push",
//                   @"Do Push the Force",
//                   @"Agile Sneaker Tricks",
//                   @"Why I Don't Stop Moving",
//                   @"Empathy for Beginners",
//                   nil];
    
    NSDictionary *blogPost1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Keys and Values", @"title", @"Joe Susnick", @"author", nil];
    NSDictionary *blogPost2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Getting started with IOS stuff", @"title", @"Joe Susnick", @"author", nil];
    NSDictionary *blogPost3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Agile Sneaker Tricks", @"title", @"Joe Susnick", @"author", nil];
    
    self.blogPosts = [NSArray arrayWithObjects:blogPost1, blogPost2, blogPost3, nil];
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
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    cell.textLabel.text = blogPost[@"title"];
    cell.detailTextLabel.text = blogPost[@"author"];
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
