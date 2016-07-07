//
//  MainTableViewCell.m
//  WalmartLabsTakeHome
//
//  Created by Jack Li on 7/6/16.
//  Copyright © 2016 Jack Li. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (void) setProduct:(Product*)product {
    _product = product;
    
    self.nameLabel.text = product.name;
    self.priceLabel.text = product.priceString;
    
    // Set height (constraint) based on aspect ratio
    if (product.image.size.width > 0) {
        CGFloat aspect = product.image.size.height / product.image.size.width;
        NSLayoutConstraint* aspectConstraint = [NSLayoutConstraint constraintWithItem:self.thumbnailImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.thumbnailImageView attribute:NSLayoutAttributeWidth multiplier:aspect constant:0];
        [self.thumbnailImageView addConstraint:aspectConstraint];
    }
    
    self.thumbnailImageView.image = product.image;
}

@end
