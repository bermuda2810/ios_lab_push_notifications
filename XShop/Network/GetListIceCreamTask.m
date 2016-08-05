//
//  GetListIceCreamTask.m
//  XShop
//
//  Created by Bui Quoc Viet on 8/5/16.
//  Copyright © 2016 NAL Viet Nam. All rights reserved.
//

#import "GetListIceCreamTask.h"
#import "AFNetworking.h"
#import "IceCream.h"

@implementation GetListIceCreamTask


- (void)requestWithBlockDone:(BlockDone)blockDone andBlockFailured:(BlockFailed)blockFailured {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = [NSString stringWithFormat:@"%@/products",@"http://52.196.211.103:3000"];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSArray *arrJson = responseObject;
        NSMutableArray *data = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in arrJson) {
            IceCream *item = [[IceCream alloc] init];
            item.ice_name = dict[@"name"];
            item.ice_price = [NSString stringWithFormat:@"%ld",[dict[@"price"] longValue]];
            item.imgUrl = dict[@"image"];
            [data addObject:item];
        }
        blockDone(data);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        blockFailured(@"Fail");
    }];
}


@end
