//
//  UUTreeTableViewNode.m
//  UUTreeTableView
//
//  Created by zhuochenming on 26/12/15.
//  Copyright (c) 2015 zhuochenming. All rights reserved.
//

#import "TreeNodeModel.h"

@implementation TreeNodeModel

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@", self.name];
}

@end