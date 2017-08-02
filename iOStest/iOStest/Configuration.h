//
//  Configuration.h
//  iOStest
//
//  Created by Admin on 8/1/17.
//  Copyright © 2017 Adelina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Configuration : NSObject

+ (instancetype)sharedInstance;

- (NSString *)requestURL;

- (CGFloat)collectionSpacing;
- (CGFloat)availabilitySpacing;

- (int)iphonePortraitCellsPerRow;
- (int)iphoneLandscapeCellsPerRow;
- (int)ipadPortraitCellsPerRow;
- (int)ipadLandscapeCellsPerRow;

@end
