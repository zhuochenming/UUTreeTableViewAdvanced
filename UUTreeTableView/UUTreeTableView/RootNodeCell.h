//
//  UUTreeTableViewCell.h
//  UUTreeTableView
//
//  Created by zhuochenming on 26/12/15.
//  Copyright (c) 2015 zhuochenming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeNodeModel.h"

static CGFloat const kRootTreeCellHeight = 50;

@interface RootNodeCell : UITableViewCell

@property (nonatomic, strong) UIImageView *plusImageView;

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UILabel *labelTitle;

@property (nonatomic, strong) UIView *underLine;

- (void)setDataWithNode:(TreeNodeModel *)node;

@end
