//
//  AppDelegate.m
//  PixoThreeTabViewXcodeProject
//
//  Created by Michael Kucinski on 7/2/15.
//  Copyright (c) 2015 Michael Kucinski. All rights reserved.
//

#import "AppDelegate.h"
#import "PMChatGroupTableViewController.h"
#import "PMMessagingUIViewController.h"
#import "PMUserListTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBars = [[UITabBarController alloc] init];
    tabBars.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    PMMessagingUIViewController *messagingUI = [[PMMessagingUIViewController alloc] initWithNibName:@"PMMessagingUIViewController" bundle:nil];
    messagingUI.tabBarItem.title = @"MessagingUI";
    
    PMChatGroupTableViewController *chatGroupTab = [[PMChatGroupTableViewController alloc] init];
    chatGroupTab.tabBarItem.title = @"Chat Groups";
    
    PMUserListTableViewController *userListTab = [[PMUserListTableViewController alloc] init];
    userListTab.tabBarItem.title = @"Users";
    
    tabBars.viewControllers = @[chatGroupTab,messagingUI,userListTab];
    
    self.window.rootViewController = tabBars;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
