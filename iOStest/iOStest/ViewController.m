//
//  ViewController.m
//  iOStest
//
//  Created by Admin on 8/1/17.
//  Copyright © 2017 Adelina. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "Configuration.h"

#define UIDeviceOrientationIsPortrait(orientation)  ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *collectionItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
    self.collectionItems = @[@"ertet"];
}

#pragma mark - collection view

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CollectionCell";
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    int cellsPerRow;
    
    CGFloat screenWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (UIDeviceOrientationIsPortrait(orientation)) {
            cellsPerRow = [[Configuration sharedInstance] iphonePortraitCellsPerRow];
        } else {
            cellsPerRow = [[Configuration sharedInstance] iphoneLandscapeCellsPerRow];
        }
    } else {
        if (UIDeviceOrientationIsPortrait(orientation)) {
            cellsPerRow = [[Configuration sharedInstance] ipadPortraitCellsPerRow];
        } else {
            cellsPerRow = [[Configuration sharedInstance] ipadLandscapeCellsPerRow];
        }
    }
    
    CGFloat collectionSpacing = [[Configuration sharedInstance] collectionSpacing];
    CGFloat cellSize = screenWidth / cellsPerRow - (cellsPerRow - 1) * collectionSpacing;
    
    return CGSizeMake(cellSize, cellSize);
}


@end
