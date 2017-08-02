//
//  CollectionModel.h
//  iOStest
//
//  Created by Admin on 8/1/17.
//  Copyright © 2017 Adelina. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "FormattedModel.h"

@protocol CollectionModel;

@interface CollectionModel : JSONModel

@property (nonatomic) NSDictionary *affiliate;
@property (nonatomic) BOOL isMOD;
@property (nonatomic) BOOL isAvailable;
@property (nonatomic) BOOL showDiscount;
@property (nonatomic) NSInteger discountPercentage;
@property (nonatomic) NSInteger id;
@property (nonatomic) BOOL isNew;
@property (nonatomic) BOOL isScheduled;
@property (nonatomic) NSString *canonicalURL;
@property (nonatomic) NSString *masterURL;
@property (nonatomic) BOOL showValue;
@property (nonatomic) BOOL showDealView;
@property (nonatomic) NSNumber<Optional> *dealToShow;
@property (nonatomic) NSString *coverImage;
@property (nonatomic) NSString *coverImageWide;
@property (nonatomic) NSString *coverImageHalf;
@property (nonatomic) NSString *newsletterCoverImage;
@property (nonatomic) NSString *collectionBoxMobile;
@property (nonatomic) BOOL showInNewsletter;
@property (nonatomic) NSString *slotRecordType;
@property (nonatomic) NSArray<NSString *> *categories;
@property (nonatomic) NSArray<NSString *> *subCategories;
@property (nonatomic) BOOL isReady;
@property (nonatomic) NSInteger productCount;
@property (nonatomic) NSDate *availableFrom;
@property (nonatomic) NSDate *availableUntil;
@property (nonatomic) NSInteger max_percentage;
@property (nonatomic) NSInteger overlayPosition1;
@property (nonatomic) NSInteger overlayPosition2;
@property (nonatomic) NSInteger overlayPosition3;
@property (nonatomic) NSInteger overlayPosition4;
@property (nonatomic) BOOL isPromotional;
@property (nonatomic) BOOL isSeasonal;
@property (nonatomic) float anchorPrice;
@property (nonatomic) BOOL showAnchorPrice;
@property (nonatomic) NSString *anchorPriceType;
@property (nonatomic) FormattedModel *formatted;
@property (nonatomic) NSString *promoChannelImage;
@property (nonatomic) NSString *promoLargeImage;
@property (nonatomic) NSString *promoMediumImage;
@property (nonatomic) NSString *promoSmallImage;
@property (nonatomic) NSString *promoSquareImage;

@end
