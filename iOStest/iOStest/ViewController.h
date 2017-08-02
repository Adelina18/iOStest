//
//  ViewController.h
//  iOStest
//
//  Created by Admin on 8/1/17.
//  Copyright © 2017 Adelina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

