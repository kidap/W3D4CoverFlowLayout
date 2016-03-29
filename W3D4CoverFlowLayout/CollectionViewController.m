//
//  CollectionViewController.m
//  W3D4CoverFlowLayout
//
//  Created by Karlo Pagtakhan on 03/24/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "CollectionViewController.h"
#import "ImageCollection.h"
#import "CollectionViewCell.h"
#import "CoverFlowLayout.h"

@interface CollectionViewController ()
@property (nonatomic, strong) ImageCollection *myCollection;
@end
@implementation CollectionViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  [self prepareData];
  [self prepareCollectionView];
}
-(void)prepareData{
  if (!self.myCollection){
    self.myCollection = [[ImageCollection alloc] init];
  }
}
-(void)prepareCollectionView{
  CoverFlowLayout *layout = [[CoverFlowLayout alloc] init];
  [self.collectionView setCollectionViewLayout:layout];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  //#warning Incomplete implementation, return the number of sections
  return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  //#warning Incomplete implementation, return the number of items
  return self.myCollection.imageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  cell.mainImageView.image = (UIImage *)self.myCollection.imageArray[indexPath.item];
  return cell;
}


@end
