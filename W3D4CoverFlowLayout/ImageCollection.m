//
//  ImageCollection.m
//  W3D4CoverFlowLayout
//
//  Created by Karlo Pagtakhan on 03/24/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ImageCollection.h"

@implementation ImageCollection
-(instancetype)init{
  if (self == [super init]) {
    _imageArray = [[NSMutableArray alloc] init];
    for (int x = 1; x <= 9; x++){
      NSString *imageName =[ NSString stringWithFormat:@"albumcover%d", x];
      UIImage *image = [UIImage imageNamed:imageName];
      if (image) {
        [_imageArray addObject:image];
        
      } else{
        NSLog(@"Error loading images");
      }
    }
  }
  return self;
}
@end
