//
//  UUTreeTableView.m
//  UUTreeTableView
//
//  Created by zhuochenming on 26/12/15.
//  Copyright (c) 2015 zhuochenming. All rights reserved.
//

#import "UUTreeTableView.h"

@interface UUTreeTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *nodesArray;

@end

@implementation UUTreeTableView

- (id)initWithFrame:(CGRect)frame nodeArray:(NSArray *)nodeArray {
    self = [super initWithFrame:frame];
    if (self) {
        
        _dataArray = [[NSMutableArray alloc] init];
        _nodesArray = [[NSMutableArray alloc] init];
        if (nodeArray && nodeArray.count) {
            [_nodesArray addObjectsFromArray:nodeArray];
            for (TreeNodeModel *node in nodeArray) {
                if (node.fathernodeID == 0) {
                    [_dataArray addObject:node];
                }
            }
        }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        [_tableView registerClass:[RootNodeCell class] forCellReuseIdentifier:@"RootNodeCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    }
    return self;
}

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier {
    [_tableView registerClass:cellClass forCellReuseIdentifier:identifier];
}

- (void)reloadData {
    [_tableView reloadData];
}

#pragma mark - UITableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.delegate respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        return [self.delegate numberOfSectionsInTableView:tableView];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.delegate tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(tableView:cellForRowAtIndexPath:dataArray:)]) {
        [self.delegate tableView:tableView cellForRowAtIndexPath:indexPath dataArray:_dataArray];
    }
    
    TreeNodeModel *model = _dataArray[indexPath.row];
    
    RootNodeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootNodeCell" forIndexPath:indexPath];
    [cell setDataWithNode:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TreeNodeModel *node = _dataArray[indexPath.row];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableView:didSelectedRowWithNode:)]) {
        [self.delegate tableView:tableView didSelectedRowWithNode:node];
    }
    
    if (node.isOpen) {
        [self minusNodesByNode:node];
    } else {
        NSUInteger index = indexPath.row + 1;
        [self addSubNodesByFatherNode:node atIndex:index];
    }
}

#pragma mark - 添加子节点
- (void)addSubNodesByFatherNode:(TreeNodeModel *)fatherNode atIndex:(NSInteger)index {
    if (fatherNode) {
        NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *indexPathArray = [NSMutableArray array];
        
        NSUInteger count = index;
        for(TreeNodeModel *model in _nodesArray) {
            if (model.fathernodeID == fatherNode.nodeID) {
                model.originX = fatherNode.originX + 10;
                [array addObject:model];
                [indexPathArray addObject:[NSIndexPath indexPathForRow:count++ inSection:0]];
            }
        }
        
        if (array.count) {
            fatherNode.isOpen = YES;
            fatherNode.subNodes = array;
            
            NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index,[array count])];
            [_dataArray insertObjects:array atIndexes:indexes];
            [_tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
            [_tableView reloadData];
        }
    }
}

#pragma mark - 根据节点减去子节点
- (void)minusNodesByNode:(TreeNodeModel *)node {
    if (node) {
        NSMutableArray *enumArray = [NSMutableArray arrayWithArray:_dataArray];
        for (TreeNodeModel *nd in enumArray) {
            if (nd.fathernodeID == node.nodeID) {
                [_dataArray removeObject:nd];
                [self minusNodesByNode:nd];
            }
        }
        node.isOpen = NO;
        [_tableView reloadData];
    }
}

@end
