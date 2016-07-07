//
//  DetailsViewController.m
//  WalmartLabsTakeHome
//
//  Created by Jack Li on 7/3/16.
//  Copyright © 2016 Jack Li. All rights reserved.
//

#import "DetailsViewController.h"
#import "DataSource.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel* nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView* productPicture;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* heightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* widthConstraint;

@property (weak, nonatomic) IBOutlet UILabel* priceLabel;
@property (weak, nonatomic) IBOutlet UILabel* detailsLabel;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameLabel.text = self.product.name;
    self.productPicture.image = self.product.image;
    
    if (self.product.image.size.width > 0) {
        self.heightConstraint.constant = (self.widthConstraint.constant / self.product.image.size.width) * self.product.image.size.height;
    }
    
    self.priceLabel.text = self.product.priceString;
    self.detailsLabel.text = self.product.summaryDescription;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
