//
//  HorizontalViewController.h
//  HorizontalScroll
//
//  Created by Zach Williams on 4/21/12.
//  Copyright (c) 2012 Zach Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;

- (IBAction)changePage:(id)sender;
- (IBAction)tapPoster:(id)sender;

@end
