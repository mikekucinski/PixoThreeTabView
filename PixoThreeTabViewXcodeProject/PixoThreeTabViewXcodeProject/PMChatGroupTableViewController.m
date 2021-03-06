//
//  PMChatGroupTableViewController.m
//  PixoThreeTabViewXcodeProject
//
//  Created by an lee on 7/2/15.
//  Copyright (c) 2015 Michael Kucinski. All rights reserved.
//

#import "PMChatGroupTableViewController.h"

@interface PMChatGroupTableViewController ()

@end

NSString * const PMCURRENTUSERCELLIDENTIFIER = @"CurrentUserCell";
NSString * const PMREGULARCELLIDENTIFIER = @"Cell";

@implementation PMChatGroupTableViewController

@synthesize groups;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(30.0f, 0.0f, 0.0f, 0.0f);
    
    self.filteredGroupArray = [NSMutableArray arrayWithCapacity:2];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PMCurrentUserInfoTableViewCell" bundle:nil] forCellReuseIdentifier:PMCURRENTUSERCELLIDENTIFIER];
    [self.tableView registerNib:[UINib nibWithNibName:@"PMGroupTableViewCell" bundle:nil] forCellReuseIdentifier:PMREGULARCELLIDENTIFIER];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*
    NSString *file = [[NSBundle mainBundle] pathForResource:@"MockupGroups" ofType:@"plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:file]) {
        NSLog(@"The file exists");
    } else {
        NSLog(@"The file does not exist");
    }
    
    groups = [[NSDictionary alloc] initWithContentsOfFile:file];
    NSLog(@"%i", [groups count]);
    */
    NSError *error = nil;
    PMDataMockup *dataModel = [[PMDataMockup alloc] init];
    NSString *json_string = [dataModel getJSONData];

    groups = [NSJSONSerialization JSONObjectWithData:[json_string dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 2;
    }
    else {
    NSArray *groupSections = [groups objectForKey:@"GroupSections"];
    return 1 + [groupSections count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section==0) {
        return 1;
    }
    else{
        NSArray *groupSections = [groups objectForKey:@"GroupSections"];
        NSDictionary *groupSection = [groupSections objectAtIndex:(section-1)];
        NSArray *sectionGroups = [groupSection objectForKey:@"Groups"];
        int numOfRows = [sectionGroups count];
        return numOfRows;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        PMCurrentUserInfoTableViewCell *currentUserInfoCell = [tableView dequeueReusableCellWithIdentifier:PMCURRENTUSERCELLIDENTIFIER];
        if (currentUserInfoCell == nil) {
            currentUserInfoCell = [tableView dequeueReusableCellWithIdentifier:PMCURRENTUSERCELLIDENTIFIER];
        }
//        currentUserInfoCell.searchBar.delegate = self;
        NSDictionary *currentUserInfoDict = [groups objectForKey:@"CurrentUserInfo"];
        currentUserInfoCell.nameLabelOfUser.text = [currentUserInfoDict objectForKey:@"Name"];
        NSString *thumbNailStr = [currentUserInfoDict objectForKey:@"ThumbNailURL"];
        NSLog(@"%@",thumbNailStr);
        [currentUserInfoCell.thumbNailOfUser setImageWithURL:[NSURL URLWithString:thumbNailStr] placeholderImage:[UIImage imageNamed:@"second"]];
//        [currentUserInfoCell.thumbNailOfUser setImageWithURL:[NSURL URLWithString:thumbNailStr]];
        
        return currentUserInfoCell;
    }
    PMGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PMREGULARCELLIDENTIFIER];
    
    NSArray *groupSections = [groups objectForKey:@"GroupSections"];
    NSDictionary *groupSection = [groupSections objectAtIndex:(indexPath.section-1)];
    NSArray *sectionGroups = [groupSection objectForKey:@"Groups"];
    
    cell.nameLabelOfGroup.text = [[sectionGroups objectAtIndex:indexPath.row] objectForKey:@"Name"];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 160;
    }
    return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }
    NSArray *groupSections = [groups objectForKey:@"GroupSections"];
    NSDictionary *groupSection = [groupSections objectAtIndex:(section-1)];
    return [groupSection objectForKey:@"Name"];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // See this webpage, 3rd answer down or so : http://stackoverflow.com/questions/813068/uitableview-change-section-header-color
    
    // Background color
    view.tintColor = [UIColor blackColor];
    
    // Text Color
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor whiteColor]];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
