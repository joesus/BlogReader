//
//  WebViewController.h
//  BlogReader
//
//  Created by A658308 on 10/31/14.
//  Copyright (c) 2014 Joe Susnick Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURL *blogPostURL;

@end
