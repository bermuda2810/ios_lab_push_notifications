//
//  RegisterPushNotificationsTask.m
//  XShop
//
//  Created by Bui Quoc Viet on 8/5/16.
//  Copyright © 2016 NAL Viet Nam. All rights reserved.
//

#import "RegisterPushNotificationsTask.h"
#import "AFNetworking.h"

@implementation RegisterPushNotificationsTask {
    NSString *_tokenKey;
}

- (instancetype)initWithTokenKey:(NSString *)tokenKey {
    self = [super init];
    if (self) {
        _tokenKey = tokenKey;
    }
    return self;
}

- (void)requestWithBlockDone:(BlockDone)blockDone andBlockFailured:(BlockFailed)blockFailured {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *url = [NSString stringWithFormat:@"%@/subscribe",@"http://52.196.211.103:3000"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:_tokenKey forKey:@"device_token"];
    [dict setObject:[NSNumber numberWithInt:1] forKey:@"os"];
    [manager POST:url parameters:dict progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
}

@end
