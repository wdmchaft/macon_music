//
//  HorizontalViewController.m
//  HorizontalScroll
//
//  Created by Zach Williams on 4/21/12.
//  Copyright (c) 2012 Zach Williams. All rights reserved.
//

#import "HorizontalViewController.h"
#import "PosterViewController.h"
#import "BandViewController.h"

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
@synthesize facebookButton;
@synthesize pageControlUsed;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customizeAppearance];
    [self enableScrollView];
    [self loadScrollView];
    // [self addHiddenView];
}

- (void)customizeAppearance
{
    // Adjust colors.
    backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rock_background.png"]];
    pageControl.backgroundColor = [UIColor clearColor];
    
    // Add the Facebook image.
    [facebookButton setImage:[UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
    [facebookButton setShowsTouchWhenHighlighted:YES];
    facebookButton.backgroundColor = [UIColor clearColor];
}

- (void)enableScrollView
{
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * PAGE_COUNT, SCROLLVIEW_HEIGHT);
    scrollView.delegate = self;
}

- (void)loadScrollView
{
    // Load the UIScrollView with the Poster controller from the storyboard.
    for (int page = 0; page < PAGE_COUNT; page++) {
        // Calculate the correct frame.
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        frame.size.height = SCROLLVIEW_HEIGHT;
        
        // Create a PosterViewController.
        PosterViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"Poster"];
        controller.view.frame = frame;
        
        // Make sure we can access when the poster image is tapped.
        [controller.button addTarget:self action:@selector(posterTap:) forControlEvents:UIControlEventTouchUpInside];
        
        // Add the PosterViewController's view to the UIScrollView.
        [scrollView addSubview:controller.view];
        
        NSLog(@"%@", controller.button.imageView.image);
    }
}

- (void)addHiddenView
{
    // Add the hidden CFA view.
    UIViewController *hidden = [self.storyboard instantiateViewControllerWithIdentifier:@"Hidden View"];
    CGRect frame = scrollView.frame;
    frame.origin.x = -frame.size.width;
    hidden.view.frame = frame;
    [scrollView addSubview:hidden.view];
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

- (IBAction)posterTap:(id)sender{
    // When a poster image has been tapped, have the Navigation Controller
    // push to the designated UIViewController.
    UIButton *btn = sender;
    float position = btn.superview.frame.origin.x / scrollView.frame.size.width;
    NSLog(@"%f", position);
    BandViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"Band"];
    [self.navigationController pushViewController:controller animated:YES];
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
    [self setFacebookButton:nil];
    [super viewDidUnload];
}
@end
