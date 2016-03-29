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

//static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Uncomment the following line to preserve selection between presentations
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Register cell classes
  //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
  
  // Do any additional setup after loading the view.
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
  
  // Configure the cell
  cell.mainImageView.image = (UIImage *)self.myCollection.imageArray[indexPath.item];
  
  return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
