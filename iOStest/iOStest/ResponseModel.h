//
//  ResponseModel.h
//  iOStest
//
//  Created by Admin on 8/1/17.
//  Copyright © 2017 Adelina. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CollectionModel.h"

@interface ResponseModel : JSONModel

@property (nonatomic) NSString *locale;
@property (nonatomic) NSNumber *pagination;
@property (nonatomic) NSArray<CollectionModel> *collections;
@property (nonatomic) NSArray *filters;

@end
