//
//  IceCreamViewCell.m
//  XShop
//
//  Created by Bui Quoc Viet on 8/5/16.
//  Copyright © 2016 NAL Viet Nam. All rights reserved.
//

#import "IceCreamViewCell.h"
#import "IceCream.h"
#import "UIImageView+AFNetworking.h"

@implementation IceCreamViewCell {
    IceCream *_data;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadData:(IceCream *)data {
    _data = data;
    [self updateView];
}

- (void)updateView {
    _lblIceCreamName.text = _data.ice_name;
    _lblIceCreamPrice.text = _data.ice_price;
    [_imgIceCream setImageWithURL:[NSURL URLWithString:_data.imgUrl]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
