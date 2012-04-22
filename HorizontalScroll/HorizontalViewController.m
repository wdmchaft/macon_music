//
//  HorizontalViewController.m
//  HorizontalScroll
//
//  Created by Zach Williams on 4/21/12.
//  Copyright (c) 2012 Zach Williams. All rights reserved.
//

#import "HorizontalViewController.h"

static NSUInteger PAGE_COUNT = 4;
static NSUInteger SCROLLVIEW_HEIGHT = 360;


@interface HorizontalViewController ()

@property (nonatomic) BOOL pageControlUsed;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end


@implementation HorizontalViewController

@synthesize backgroundView;
@synthesize scrollView;
@synthesize pageControl;
@synthesize infoButton;
@synthesize pageControlUsed;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customizeAppearance];
    [self enableScrollView];
}

- (void)customizeAppearance
{
    // Adjust colors.
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    pageControl.backgroundColor = [UIColor clearColor];
}

- (void)enableScrollView
{
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * PAGE_COUNT, SCROLLVIEW_HEIGHT);
    scrollView.delegate = self;
}

- (void)scrollViewDidScroll:(UIScrollView *)view
{
    // Check to see if the UIPageControl was used.
    if (pageControlUsed) {
        return;
    }
    
    // Switch the UIPageControl indicator.
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((view.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    // Update the UIPageControl.
    pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // Signal the UIPageControl was not used.
    pageControlUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // Signal the UIPageControl was not used.
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender {
    // Programmatically scroll the UIScrollView.
    int page = pageControl.currentPage;
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
    // Signal that the UIPageControl was used.
    pageControlUsed = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"More Info"]) {
        NSLog(@"Info button was tapped.");
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [self setInfoButton:nil];
    [super viewDidUnload];
}

@end
