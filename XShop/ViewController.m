//
//  ViewController.m
//  XShop
//
//  Created by Bui Quoc Viet on 8/5/16.
//  Copyright © 2016 NAL Viet Nam. All rights reserved.
//

#import "ViewController.h"
#import "IceCreamViewCell.h"
#import "IceCream.h"
#import "GetListIceCreamTask.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblIceCream;

@end

@implementation ViewController {
    NSMutableArray<IceCream *> *_data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [[NSMutableArray alloc] init];
    _tblIceCream.estimatedRowHeight = 40;
    _tblIceCream.rowHeight = UITableViewAutomaticDimension;
    [self getData];
}

- (void)getData {
    GetListIceCreamTask *task = [[GetListIceCreamTask alloc]init];
    [task requestWithBlockDone:^(id data) {
        _data = data;
        [_tblIceCream reloadData];
    } andBlockFailured:^(NSString *errorMessage) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table Views

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IceCream *ice_cream = [_data objectAtIndex:indexPath.row];
    IceCreamViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IceCreamViewCell" forIndexPath:indexPath];
    [cell loadData:ice_cream];
    return cell;
}

@end
