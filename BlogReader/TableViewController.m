//
//  TableViewController.m
//  BlogReader
//
//  Created by A658308 on 10/14/14.
//  Copyright (c) 2014 Joe Susnick Co. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"

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
    
//    // Uses the designated initializer for BlogPost
//    BlogPost *blogPost = [[BlogPost alloc] initWithTitle:@"New Post"];
//    blogPost.author = @"Author";
//    
//    // Uses the convenience constructor for BlogPost
//    BlogPost *anotherBlogPost = [BlogPost blogPostWithTitle:@"another title"];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
  
    // creates a property with a mutable array to hold our BlogPost objects
    self.blogPosts = [NSMutableArray array];
    
    // creates an array of dictionaries to hold the posts
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    // loops through the dictionaries and creates BlogPost objects to store in our mutable array
    for (NSDictionary *postDictionary in blogPostsArray) {
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[postDictionary objectForKey:@"title"]];
        blogPost.author = [postDictionary objectForKey:@"author"];
        blogPost.thumbnail = [postDictionary objectForKey:@"thumbnail"];
        [self.blogPosts addObject:blogPost];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // initializes a blogpost 
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
//    // adding an image programatically
//    cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    cell.imageView.image = image;
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = blogPost.author;
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
