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
#import "ResponseModel.h"
#import "CollectionModel.h"

#define UIDeviceOrientationIsPortrait(orientation)  ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray<CollectionModel *> *collectionItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self loadData];
}

- (void)viewWillLayoutSubviews {
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURL *url = [NSURL URLWithString:[[Configuration sharedInstance] requestURL]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            ResponseModel *response = [[ResponseModel alloc] initWithData:data error:&error];
            self.collectionItems = [[NSMutableArray alloc] initWithArray:response.collections];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }
    }];
    
    [dataTask resume];
}

- (NSString *)availabilityForDate:(NSDate *)date {
    NSString *availability;
    NSDate *currentDate = [NSDate date];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    unsigned int unitComponents = NSCalendarUnitDay | NSCalendarUnitHour;
    NSDateComponents *components = [gregorianCalendar components:unitComponents fromDate:currentDate toDate:date options:0];
    
    int daysLeft = (int)components.day;
    int hoursLeft = (int)components.hour;
    
    if (daysLeft > 3) {
        availability = @"Limited time";
    } else {
        if (daysLeft > 1) {
            availability = [NSString stringWithFormat:@"%d days left", daysLeft];
        } else {
            if (hoursLeft < 0) {
                availability = @"Unavailable";
            } else {
            availability = [NSString stringWithFormat:@"%d hours left", hoursLeft];
            }
        }
    }
    
    return availability;
}

#pragma mark - collection view

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CollectionCell";
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    CollectionModel *model = [self.collectionItems objectAtIndex:indexPath.row];
    
    NSString *imageURL = [NSString stringWithFormat:@"http:%@", model.promoChannelImage];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageURL]];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:model.formatted.value];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName
                            value:@1
                            range:NSMakeRange(0, [attributeString length])];
    
    cell.availability.text = [self availabilityForDate:model.availableUntil];
    
    cell.image.image = [UIImage imageWithData:imageData];
    cell.value.attributedText = attributeString;
    cell.title.text = model.formatted.title;
    cell.price.text = model.formatted.price;
    cell.discount.text = [NSString stringWithFormat:@"-%@%%",model.formatted.discount];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    int cellsPerRow;
    
    CGFloat screenWidth = CGRectGetWidth(self.collectionView.frame);
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
