//
//  HorizontalAppDelegate.m
//  HorizontalScroll
//
//  Created by Zach Williams on 4/21/12.
//  Copyright (c) 2012 Zach Williams. All rights reserved.
//

#import "HorizontalAppDelegate.h"

@implementation HorizontalAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self customizeAppearance];
    return YES;
}

- (void)customizeAppearance
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"leather.png"]
                                       forBarMetrics:UIBarMetricsDefault];
}
							
@end
