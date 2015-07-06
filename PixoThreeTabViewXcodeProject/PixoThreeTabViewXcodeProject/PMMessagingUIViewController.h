//
//  PMMessagingUIViewController.h
//  PixoThreeTabViewXcodeProject
//
//  Created by an lee on 7/4/15.
//  Copyright (c) 2015 Michael Kucinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMMessagingUIViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic,weak) NSMutableArray   *messages;
@property (nonatomic,weak) IBOutlet UICollectionView *collectionView;

@end
