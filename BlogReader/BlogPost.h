//
//  BlogPost.h
//  BlogReader
//
//  Created by A658308 on 10/15/14.
//  Copyright (c) 2014 Joe Susnick Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *thumbnail;
@property (strong, nonatomic) NSString *date;

// id is general purpose data type that can create an instance of any class
// designated initializer
- (id) initWithTitle:(NSString *)title;

// convenience constructor. The implementation generally will call the designated initializer
+ (id) blogPostWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;

//// primitive values do not need strong/weak or *
//@property (nonatomic) int views;
//// can rename getters
//@property (nonatomic, getter = isUnread) BOOL unread;

@end
