//
//  PosterViewController.m
//  HorizontalScroll
//
//  Created by Zach Williams on 4/22/12.
//  Copyright (c) 2012 Zach Williams. All rights reserved.
//

#import "PosterViewController.h"

@interface PosterViewController ()

@end

@implementation PosterViewController

@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
