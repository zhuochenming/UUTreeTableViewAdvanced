//
//  UUTreeTableView.h
//  UUTreeTableView
//
//  Created by zhuochenming on 26/12/15.
//  Copyright (c) 2015 zhuochenming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootNodeCell.h"
#import "TreeNodeModel.h"

@class UUTreeTableView;
@protocol UUTreeTableViewDelegate <NSObject>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath dataArray:(NSArray *)dataArray;

- (void)tableView:(UITableView *)tableView didSelectedRowWithNode:(TreeNodeModel *)node;

@end

@interface UUTreeTableView : UIView

@property (nonatomic,assign) id <UUTreeTableViewDelegate>delegate;

- (id)initWithFrame:(CGRect)frame nodeArray:(NSArray *)nodeArray;

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier;

- (void)reloadData;

@end
