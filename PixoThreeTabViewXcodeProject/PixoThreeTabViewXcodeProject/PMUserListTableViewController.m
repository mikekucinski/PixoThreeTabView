//
//  PMUserListTableViewController.m
//  PixoThreeTabViewXcodeProject
//
//  Created by Michael Kucinski on 7/2/15.
//  Copyright (c) 2015 Michael Kucinski. All rights reserved.
//

#import "PMUserListTableViewController.h"


@interface PMUserListTableViewController ()

@end

@implementation PMUserListTableViewController

@synthesize contacts;


static NSString *contactCellIdentifier = @"Contact Cell";
static NSString *contactSearchCellIdentifier = @"Contact Search Cell";
static NSString *contactNibName = @"PMContactTableViewCell";
static NSString *contactSearchNibName = @"PMContactSearchTableViewCell";

UIImage * simpleImageWithColorGreen;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:contactNibName bundle:nil] forCellReuseIdentifier:contactCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:contactSearchNibName bundle:nil] forCellReuseIdentifier:contactSearchCellIdentifier];
    
    self.tableView.contentInset = UIEdgeInsetsMake(30.0f, 0.0f, 0.0f, 0.0f);

    NSError *error = nil;
    PMDataMockup *dataModel = [[PMDataMockup alloc] init];
    NSString *json_string = [dataModel getJSONData];
    NSLog(@"%@", json_string);
    contacts = [NSJSONSerialization JSONObjectWithData:[json_string dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    simpleImageWithColorGreen = [self imageWithColor:[UIColor colorWithRed:0/256.0 green:256/256.0 blue:0/256.0 alpha:1.0]];
    
    /*
    if ([self.tableView respondsToSelector:@selector(setSectionIndexColor:)]) {
        self.tableView.sectionIndexBackgroundColor = [UIColor greenColor];
        self.tableView.sectionIndexTrackingBackgroundColor = [UIColor orangeColor];
    }
     */
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

const NSInteger noSectionTitleForTopCellSoOffset_1 = 1;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    NSArray *groupSections = [contacts objectForKey:@"UserSections"];
    return noSectionTitleForTopCellSoOffset_1 + [groupSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section==0) {
        return 1;
    }
    else{
        NSArray *groupSections = [contacts objectForKey:@"UserSections"];
        NSDictionary *groupSection = [groupSections objectAtIndex:(section-1)];
        NSArray *sectionGroups = [groupSection objectForKey:@"Users"];
        NSUInteger numOfRows = [sectionGroups count];
        return numOfRows;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        PMContactSearchTableViewCell *currentContactSearchCell = [tableView dequeueReusableCellWithIdentifier:contactSearchCellIdentifier];

        return currentContactSearchCell;
    }
    
    PMContactTableViewCell *currentContactCell = [tableView dequeueReusableCellWithIdentifier:contactCellIdentifier];

    NSArray *contactSections = [contacts objectForKey:@"UserSections"];
    NSDictionary *contactSection = [contactSections objectAtIndex:(indexPath.section-1)];
    NSArray *sectionContacts = [contactSection objectForKey:@"Users"];
    
    currentContactCell.nameOfContactLabel.text = [[sectionContacts objectAtIndex:indexPath.row] objectForKey:@"Name"];
    
    NSDictionary *currentUserInfoDict = [contacts objectForKey:@"CurrentUserInfo"];
    NSString *thumbNailStr = [currentUserInfoDict objectForKey:@"ThumbNailURL"];
    NSLog(@"%@",thumbNailStr);
    [currentContactCell.thumbNailOfUser setImageWithURL:[NSURL URLWithString:thumbNailStr] placeholderImage:[UIImage imageNamed:@"second"]];
    //[currentContactCell.thisContactIsCurrentlyOnlineIndication setImageWithURL:[NSURL URLWithString:thumbNailStr] placeholderImage:[UIImage imageNamed:@"second"]];
    [currentContactCell.thisContactIsCurrentlyOnlineIndication setImage:simpleImageWithColorGreen];
    if (indexPath.row %2 == 0) {
        [currentContactCell.thisContactIsCurrentlyOnlineIndication setAlpha:0 ];
    }
    else
    {
        [currentContactCell.thisContactIsCurrentlyOnlineIndication setAlpha:1 ];
    }
    
    return currentContactCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 44;
    }
    return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }
    
    NSArray *contactSections = [contacts objectForKey:@"UserSections"];
    NSDictionary *contactSection = [contactSections objectAtIndex:(section-1)];
    return [contactSection objectForKey:@"Name"];
}

/*
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Mike notes : this is from http://stackoverflow.com/questions/6662301/how-to-change-font-color-of-section-index-titles
    
    // Background color
    //view.tintColor = [UIColor blueColor];
    
    //////tableView.sectionIndexColor = [UIColor greenColor];
    ;
}

- (UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
    NSString* sectionFooter = [self tableView:tableView titleForFooterInSection:section];
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)]; //create a view- the width should usually be the width of the screen
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    label.backgroundColor = [UIColor blueColor];
    label.textColor = [UIColor whiteColor];
    label.text = sectionFooter;
    
    [view addSubview:label];
    
    return view;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // from http://stackoverflow.com/questions/1597662/how-can-i-set-rich-text-properties-on-a-uitableview-footer

    if ( section == 1 )
    {
        return NSLocalizedString(@"Section_1_text", @"");
    }
    if ( section == 2 )
    {
        return NSLocalizedString(@"Section_2_text","");
    }
    return nil;  
}
 
 */


- (UIImage *)imageWithColor:(UIColor *)color {
    
    // See http://stackoverflow.com/questions/14523348/how-to-change-the-background-color-of-a-uibutton-while-its-highlighted  about setting background image.
    
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
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
