//
//  IceCreamViewCell.h
//  XShop
//
//  Created by Bui Quoc Viet on 8/5/16.
//  Copyright © 2016 NAL Viet Nam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IceCream;

@interface IceCreamViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgIceCream;
@property (weak, nonatomic) IBOutlet UILabel *lblIceCreamName;
@property (weak, nonatomic) IBOutlet UILabel *lblIceCreamPrice;

- (void)loadData:(IceCream *)data;

@end
