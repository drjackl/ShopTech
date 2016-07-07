//
//  Product.h
//  WalmartLabsTakeHome
//
//  Created by Jack Li on 7/6/16.
//  Copyright © 2016 Jack Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Product : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* imageURLString;
@property (nonatomic) UIImage* image;
@property (nonatomic, copy) NSString* priceString;
@property (nonatomic, copy) NSString* summaryDescription;
@property (nonatomic, copy) NSString* detailDescriptionRaw;
@property (nonatomic) BOOL inStock;

- (instancetype) initWithDictionary:(NSDictionary*)productDictionary;

@end
