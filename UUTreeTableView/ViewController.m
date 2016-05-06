//
//  ViewController.m
//  UUTreeTableView
//
//  Created by zhuochenming on 26/12/15.
//  Copyright (c) 2015 zhuochenming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UUTreeTableView *_dynamicTree;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dynamicTree = [[UUTreeTableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20) nodeArray:[self networkData]];
    _dynamicTree.delegate = self;
    [_dynamicTree registerClass:[RootNodeCell class] forCellReuseIdentifier:@"root"];
    [_dynamicTree registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_dynamicTree];
}

- (NSArray *)networkData {
    NSMutableArray *arr = [NSMutableArray array];
    
    TreeNodeModel *root = [[TreeNodeModel alloc] init];
    root.originX = 20.f;
    root.fathernodeID = 0;
    root.nodeID = 1000;
    root.name = @"iOS122";
    root.dataDic = @{@"name" : @"iOS122"};
    
    [arr addObject:root];
    
    TreeNodeModel *dashen = [[TreeNodeModel alloc] init];
    dashen.fathernodeID = 1000;
    dashen.nodeID = 1100;
    dashen.name = @"大神";
    dashen.dataDic = @{@"name" : @"大神"};
    
    [arr addObject:dashen];
    
    TreeNodeModel *xiaobai = [[TreeNodeModel alloc] init];
    xiaobai.fathernodeID = 1000;
    xiaobai.nodeID = 1200;
    xiaobai.name = @"小白";
    xiaobai.dataDic = @{@"name" : @"小白"};
    
    [arr addObject:xiaobai];
    
    TreeNodeModel *fengshen = [[TreeNodeModel alloc] init];
    fengshen.fathernodeID = 1100;
    fengshen.nodeID = 1110;
    fengshen.name = @"风神";
    fengshen.dataDic = @{@"name" : @"风神"};
    
    [arr addObject:fengshen];
    
    TreeNodeModel *daoban = [[TreeNodeModel alloc] init];
    daoban.fathernodeID = 1100;
    daoban.nodeID = 1120;
    daoban.name = @"盗版";
    daoban.dataDic = @{@"name" : @"盗版"};
    
    [arr addObject:daoban];
    
    TreeNodeModel *haizhi = [[TreeNodeModel alloc] init];
    haizhi.fathernodeID = 1120;
    haizhi.nodeID = 1121;
    haizhi.name = @"孩纸";
    haizhi.dataDic = @{@"name" : @"孩纸"};
    
    [arr addObject:haizhi];
    
    TreeNodeModel *xiaoba = [[TreeNodeModel alloc] init];
    xiaoba.fathernodeID = 1200;
    xiaoba.nodeID = 1210;
    xiaoba.name = @"小八";
    xiaoba.dataDic = @{@"name" : @"小八"};
    
    [arr addObject:xiaoba];
    
    TreeNodeModel *heheda = [[TreeNodeModel alloc] init];
    heheda.originX = 20.f;
    heheda.fathernodeID = 0;
    heheda.nodeID = 2000;
    heheda.name = @"一做iOS愁似海";
    heheda.dataDic = @{@"name" : @"一做iOS愁似海"};
    
    [arr addObject:heheda];
    
    
    return arr;
}

- (CGFloat)tableView:(UUTreeTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UUTreeTableView *)tableView didSelectedRowWithNode:(TreeNodeModel *)node {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你好，我的名字叫"
                                                    message:node.name
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"知道了", nil];
    [alert show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    });
}

@end
