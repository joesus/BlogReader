//
//  BlogPost.m
//  BlogReader
//
//  Created by A658308 on 10/15/14.
//  Copyright (c) 2014 Joe Susnick Co. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

// designated initializer
- (id) initWithTitle:(NSString *)title {
    // sends us initialized instance of blogpost
    self = [super init];
    
    // ensures that instance was created successfully
    if (self) {
        // sets the title attribute
        // same as [self setTitle:title];
        self.title = title;
        self.author = nil;
        self.thumbnail = nil;
    }
    // returns self
    return self;
}

// convenience constructor
+ (id) blogPostWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (NSURL *) thumbnailURL {
    // debugging exercise
    NSLog(@"%@", [self.thumbnail class]);
    return [NSURL URLWithString:self.thumbnail];
}

- (NSString *) formattedDate {
    // creates a dateFormatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // sets the date format, tells it what to expect from our date string
    [dateFormatter setDateFormat:@"yyyy-M-dd HH:mm:ss"];
    // creates a date object from our property
    NSDate *tempDate = [dateFormatter dateFromString:self.date];
    // creates a new date format
    [dateFormatter setDateFormat:@"EE MMM, dd"];
    // returns our reformatted date object as a string
    return [dateFormatter stringFromDate:tempDate];
}


// Synthesizes the implementation of the getter and setter methods on instance variables.
//@synthesize someTitle = title;

@end
