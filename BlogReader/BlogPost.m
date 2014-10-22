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


// Synthesizes the implementation of the getter and setter methods on instance variables.
//@synthesize someTitle = title;

@end
