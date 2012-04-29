//
//  MaconMusicAppDelegate.m
//  Macon Music
//
//  Created by Zach Williams on 4/21/12.
//  Copyright (c) 2012 Zach Williams. All rights reserved.
//

#import "MaconMusicAppDelegate.h"

@implementation MaconMusicAppDelegate

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
    UIImage *back = [[UIImage imageNamed:@"back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 15, 1, 5)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:back
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
}
							
@end
