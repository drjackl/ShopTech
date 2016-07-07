//
//  MainTableViewCell.h
//  WalmartLabsTakeHome
//
//  Created by Jack Li on 7/6/16.
//  Copyright © 2016 Jack Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface MainTableViewCell : UITableViewCell

@property (nonatomic) Product* product;

@property (weak, nonatomic) IBOutlet UIImageView* thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel* priceLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* thumbnailWidthConstraint;

@end
