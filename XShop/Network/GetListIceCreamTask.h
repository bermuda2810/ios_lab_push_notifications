//
//  GetListIceCreamTask.h
//  XShop
//
//  Created by Bui Quoc Viet on 8/5/16.
//  Copyright © 2016 NAL Viet Nam. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BlockDone)(id data);
typedef void(^BlockFailed)(NSString *errorMessage);

@interface GetListIceCreamTask : NSObject

- (void)requestWithBlockDone:(BlockDone)blockDone andBlockFailured:(BlockFailed)blockFailured;

@end
