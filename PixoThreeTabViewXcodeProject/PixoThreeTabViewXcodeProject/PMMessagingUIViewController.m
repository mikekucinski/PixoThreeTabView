//
//  PMMessagingUIViewController.m
//  PixoThreeTabViewXcodeProject
//
//  Created by an lee on 7/4/15.
//  Copyright (c) 2015 Michael Kucinski. All rights reserved.
//

#import "PMMessagingUIViewController.h"
#import "PMDataMockup.h"

@interface PMMessagingUIViewController ()

@end

#define PMMESSAGINGUISECTIONNUMBER 1
NSString * const PMCOLLECTIONVIEWCELLIDENTIFIER = @"COLLECTIONVIEWCELLID";

@implementation PMMessagingUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:PMCOLLECTIONVIEWCELLIDENTIFIER];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    NSError *error = nil;
    PMDataMockup *dataModel = [[PMDataMockup alloc] init];
    NSString *json_string = [dataModel getJSONData];
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[json_string dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    self.messages = [dictionary objectForKey:@"Messages"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
  return PMMESSAGINGUISECTIONNUMBER;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return [self.messages count];
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:PMCOLLECTIONVIEWCELLIDENTIFIER forIndexPath:indexPath];

    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *message = [self.messages objectAtIndex:indexPath.row];
//    FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
    // 2
    CGSize retval = CGSizeMake(100, 100);
    retval.height += 35; retval.width += 35;
    return retval;
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

@end
