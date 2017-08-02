//
//  Configuration.m
//  iOStest
//
//  Created by Admin on 8/1/17.
//  Copyright © 2017 Adelina. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

static int kSpacing = 5;
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

- (int)collectionSpacing {
    return kSpacing;
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
