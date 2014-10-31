//
//  TableViewController.m
//  BlogReader
//
//  Created by A658308 on 10/14/14.
//  Copyright (c) 2014 Joe Susnick Co. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "WebViewController.h"

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
        blogPost.date = [postDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[postDictionary objectForKey:@"url"]];
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
    
    // sets default thumbnail is thumbnail from data is not valid
    if ( [blogPost.thumbnail isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        
        cell.imageView.image = image;
    } else {
        //    // adding an image programatically
        cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    }
    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Author: %@ - %@", blogPost.author, [blogPost formattedDate]];
    return cell;
}

// This method is part of UIViewController, one of the storyboard methods.
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Grabs the indexPath of the row of the table view that was the sender
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    // Reinitializes the blogpost with that index
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    if ( [segue.identifier isEqualToString:@"showBlogPost"]) {
        // Sets the blogPostURL property of the destination view controller
        [segue.destinationViewController setBlogPostURL:blogPost.url];
        
        // alternately can use casting (changing the destination view controller from type id to type WebViewController
        // Then setting the property of that controller directly.
//        WebViewController *wbc = (WebViewController *)segue.destinationViewController;
//        wbc.blogPostURL = blogPost.url;
    }
}

@end
