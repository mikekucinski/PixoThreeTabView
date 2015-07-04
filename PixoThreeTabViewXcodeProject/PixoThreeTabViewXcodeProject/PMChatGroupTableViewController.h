//
//  PMChatGroupTableViewController.h
//  PixoThreeTabViewXcodeProject
//
//  Created by an lee on 7/2/15.
//  Copyright (c) 2015 Michael Kucinski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMCurrentUserInfoTableViewCell.h"
#import "PMDataMockup.h"
#import <UIImageView+AFNetworking.h>
#import "PMGroupTableViewCell.h"

@interface PMChatGroupTableViewController : UITableViewController<UISearchBarDelegate>
@property (nonatomic, strong) NSDictionary *groups;
@property (strong,nonatomic) NSMutableArray *filteredGroupArray;

@end
