//
//  DataSource.m
//  WalmartLabsTakeHome
//
//  Created by Jack Li on 7/2/16.
//  Copyright © 2016 Jack Li. All rights reserved.
//

#import "DataSource.h"
#import "Product.h"

static NSString* baseURLString = @"https://walmartlabs-test.appspot.com/_ah/api/walmart/v1";
static NSString* productsURLString = @"walmartproducts";
static NSString* apiKey = @"6858d0e9-8e01-4b98-bbad-7bf14ca0742a";
static int startPage = 1;
static int pageLength = 10;


@implementation DataSource

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static DataSource* onlySource;
    dispatch_once(&onceToken, ^{
        onlySource = [self new];
    });
    return onlySource;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        self.products = [NSMutableArray new];
        [self loadProductsWithPage:startPage];
    }
    return self;
}


- (void) loadNextBatch {
    long lastPage = self.products.count / pageLength;
    long nextPage = lastPage + 1;
    
    [self loadProductsWithPage:nextPage];
}

- (void) loadProductsWithPage:(long)page {
    NSString* urlString = [NSString stringWithFormat:@"%@/%@/%@/%ld/%d", baseURLString, productsURLString, apiKey, page, pageLength];
    NSURL* url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        
        NSURLResponse* response;
        NSError* error;
        NSData* productsJSON = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if (productsJSON) {
            NSError* jsonError;
            NSDictionary* productsDictionary = [NSJSONSerialization JSONObjectWithData:productsJSON options:0 error:&jsonError];
            
            [self loadProductsWithDictionary:productsDictionary];
        }
    }
}

- (void) loadProductsWithDictionary:(NSDictionary*)dictionary {
    NSArray* productList = dictionary[@"products"];
    for (int i = 0; i < productList.count; i++) {
        Product* product = [[Product alloc] initWithDictionary:productList[i]];
        [self.products addObject:product];
    }
}


@end
