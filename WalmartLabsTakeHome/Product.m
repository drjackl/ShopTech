//
//  Product.m
//  WalmartLabsTakeHome
//
//  Created by Jack Li on 7/6/16.
//  Copyright © 2016 Jack Li. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype) initWithDictionary:(NSDictionary*)productDictionary {
    self = [super init];
    if (self) {
        self.name = productDictionary[@"productName"];
        
        //self.imageURLString = @"https://upload.wikimedia.org/wikipedia/commons/2/23/Corner_of_Parthenon_in_Nashville,_TN,_US.jpg"; // horizontal image test
        //self.imageURLString = @"http://www.towerofpisa.org/wp-content/uploads/2015/04/pisa-leaning-tower1-224x300.jpg"; // vertical image test
        
        self.imageURLString = productDictionary[@"productImage"];
        
        NSURL* imageURL = [NSURL URLWithString:self.imageURLString];
        if (imageURL) {
            NSURLRequest* request = [NSURLRequest requestWithURL:imageURL];
            
            NSURLResponse* response;
            NSError* error;
            NSData* imageData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            if (imageData) {
                self.image = [UIImage imageWithData:imageData];
            }
        }
        
        self.priceString = productDictionary[@"price"];
        self.summaryDescription = productDictionary[@"shortDescription"];
        self.detailDescriptionRaw = productDictionary[@"longDescription"];
        self.inStock = productDictionary[@"inStock"] ? YES : NO;
    }
    return self;
}


@end
