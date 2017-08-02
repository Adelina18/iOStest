//
//  FormattedModel.h
//  iOStest
//
//  Created by Admin on 8/1/17.
//  Copyright © 2017 Adelina. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface FormattedModel : JSONModel

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *secondaryTitle;
@property (nonatomic) NSString *value;
@property (nonatomic) NSString *price;
@property (nonatomic) NSString *discount;
@property (nonatomic) NSString *description;
@property (nonatomic) NSString *keywords;
@property (nonatomic) NSString *anchorPrice;
@property (nonatomic) NSString *anchorPriceType;

@end
