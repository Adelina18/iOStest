//
//  Configuration.m
//  iOStest
//
//  Created by Admin on 8/1/17.
//  Copyright © 2017 Adelina. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

static NSString *kRequestURL = @"https://deindeal.ch/api/public/v1/data/categories/design/collections?locale=de";

static CGFloat kCollectionSpacing = 5;
static CGFloat kAvailabilitySpacing = 20;

static int kIphonePortraitCellsPerRow = 1;
static int kIphoneLandscapeCellsPerRow = 2;
static int kIpadPortraitCellsPerRow = 2;
static int kIpadLandscapeCellsPerRow = 3;


+ (instancetype)sharedInstance {
    static Configuration *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (NSString *)requestURL {
    return kRequestURL;
}

- (CGFloat)collectionSpacing {
    return kCollectionSpacing;
}

- (CGFloat)availabilitySpacing {
    return kAvailabilitySpacing;
}

- (int)iphonePortraitCellsPerRow {
    return kIphonePortraitCellsPerRow;
}

- (int)iphoneLandscapeCellsPerRow {
    return kIphoneLandscapeCellsPerRow;
}

- (int)ipadPortraitCellsPerRow {
    return kIpadPortraitCellsPerRow;
}

- (int)ipadLandscapeCellsPerRow {
    return kIpadLandscapeCellsPerRow;
}

@end
