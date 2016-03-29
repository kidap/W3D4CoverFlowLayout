//
//  CoverFlowLayout.m
//  W3D4CoverFlowLayout
//
//  Created by Karlo Pagtakhan on 03/24/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "CoverFlowLayout.h"

static CGFloat ZOOM_FACTOR = 1.2;

@implementation CoverFlowLayout

-(instancetype)init{
  if (self = [super init]) {
    self.itemSize = CGSizeMake(200, 200);
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  }
  return self;
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
  NSArray* attributes = [super layoutAttributesForElementsInRect:rect];
  
  CGRect visibleRect;
  visibleRect.origin = self.collectionView.contentOffset;
  visibleRect.size = self.collectionView.bounds.size;
  
  float collectionViewHalfFrame = self.collectionView.frame.size.width/2.0;
  
  NSLog(@"START-----------------------------------");
  for (UICollectionViewLayoutAttributes* layoutAttributes in attributes) {
    if (CGRectIntersectsRect(layoutAttributes.frame, rect)) {
      
      //Distance from center of the layoutAttribute from the center of the visible rectangle
      CGFloat distance = CGRectGetMidX(visibleRect) - layoutAttributes.center.x;
      
      //get percentage of the distance with respect to 1/2 of the collection view frame
      CGFloat normalizedDistance= distance / collectionViewHalfFrame;
      
      if (ABS(distance) < collectionViewHalfFrame) {
        
        CGFloat zoom = 1 + ZOOM_FACTOR*(1- ABS(normalizedDistance));
        NSLog(@"Zoom factor: %f",zoom);
        NSLog(@"NormalizedDistance: %f",normalizedDistance);
        
        //Rotation
        CATransform3D rotationTransform = CATransform3DIdentity;
        //rotationTransform = CATransform3DMakeRotation(normalizedDistance * M_PI_2 *0.8, 0.0f, 1.0f, 0.0f);
        rotationTransform = CATransform3DMakeRotation(normalizedDistance * M_PI_2 *1.6, 0.0f, 1.0f, 0.0f);
        
        //Zoom
        CATransform3D zoomTransform = CATransform3DMakeScale(zoom, zoom, 1.0);
        
        //Set rotation and zoom
        layoutAttributes.transform3D = CATransform3DConcat(zoomTransform, rotationTransform);
        
        //Controls which view is on top or bottom
        layoutAttributes.zIndex = ABS(normalizedDistance) * 10.0f;
        
        //Adjust alpha based on distance from center
        CGFloat alpha = (1  - ABS(normalizedDistance)) + 0.1;
        if (alpha > 1.0f) alpha = 1.0f;
        layoutAttributes.alpha = alpha;
      } else{
        layoutAttributes.alpha = 0.0f;
      }
    }
  }
  NSLog(@"END-----------------------------------");
  
  return attributes;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
  return YES;
}
@end
