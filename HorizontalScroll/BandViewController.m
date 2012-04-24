//
//  BandViewController.m
//  HorizontalScroll
//
//  Created by Zach Williams on 4/23/12.
//  Copyright (c) 2012 Zach Williams. All rights reserved.
//

#import "BandViewController.h"

@interface BandViewController ()
@end


@implementation BandViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Band";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
