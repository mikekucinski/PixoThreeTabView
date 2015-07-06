//
//  PMUserListTableViewController.h
//  PixoThreeTabViewXcodeProject
//
//  Created by Michael Kucinski on 7/2/15.
//  Copyright (c) 2015 Michael Kucinski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMContactTableViewCell.h"
#import "PMContactSearchTableViewCell.h"
#import "PMDataMockup.h"
#import <UIImageView+AFNetworking.h>



@interface PMUserListTableViewController : UITableViewController
@property (nonatomic, strong) NSDictionary *contacts;

@end
