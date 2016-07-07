//
//  DataSource.h
//  WalmartLabsTakeHome
//
//  Created by Jack Li on 7/2/16.
//  Copyright © 2016 Jack Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

@property (nonatomic) NSMutableArray* products;

+ (instancetype) sharedInstance;

- (void) loadNextBatch;

@end
