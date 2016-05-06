//
//  UUTreeTableViewNode.h
//  UUTreeTableView
//
//  Created by zhuochenming on 26/12/15.
//  Copyright (c) 2015 zhuochenming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TreeNodeModel : NSObject

@property (nonatomic, assign) CGFloat originX;         //坐标x

@property (nonatomic, assign) NSInteger fathernodeID;  //父节点的id

@property (nonatomic, assign) NSInteger nodeID;        //当前节点id

@property (nonatomic, assign) BOOL isOpen;             //是否展开的

@property (nonatomic, strong) NSString *name;          //名称

@property (nonatomic, strong) NSDictionary *dataDic;   //节点详细

@property (nonatomic, strong) NSArray *subNodes;       //子节点

@end
