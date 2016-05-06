//
//  UUTreeTableViewCell.m
//  UUTreeTableView
//
//  Created by zhuochenming on 26/12/15.
//  Copyright (c) 2015 zhuochenming. All rights reserved.
//

#import "RootNodeCell.h"

@interface RootNodeCell ()

@end

@implementation RootNodeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.plusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 30, 30)];
        self.plusImageView.image = [UIImage imageNamed:@"plus"];
        self.plusImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_plusImageView];
        
        self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_plusImageView.frame), 10, 30, 30)];
        self.avatarImageView.backgroundColor = [UIColor lightGrayColor];
        self.avatarImageView.layer.cornerRadius = 5.f;
        self.avatarImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatarImageView];
        
        self.labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame), 10, 130, 30)];;
        self.labelTitle.font = [UIFont systemFontOfSize:15];
        self.labelTitle.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_labelTitle];
        
        self.underLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 1.0, CGRectGetWidth(self.contentView.frame), 1.0)];
        self.underLine.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_underLine];
    }
    return self;
}

- (void)setDataWithNode:(TreeNodeModel *)node {
    if (node) {
        [self setCellStypeWithType:0 originX:node.originX];
        
        if (node.fathernodeID == 0) {
            self.labelTitle.text = [NSString stringWithFormat:@"%@",node.name];
        } else {
            self.labelTitle.text = [NSString stringWithFormat:@"%@(%lu)",node.name,(unsigned long)node.subNodes.count];
        }
        
        if (node.isOpen) {
            self.plusImageView.image = [UIImage imageNamed:@"minus"];
        } else {
            self.plusImageView.image = [UIImage imageNamed:@"plus"];
        }
    }
}

- (void)setCellStypeWithType:(NSInteger)type originX:(CGFloat)x {
    if (type == 0) {
        self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width, kRootTreeCellHeight);
        
        self.avatarImageView.hidden = YES;
        
        //设置 + 号的位置
        self.plusImageView.frame = CGRectMake(x, self.plusImageView.frame.origin.y, self.plusImageView.frame.size.width, self.plusImageView.frame.size.height);
        
        //设置 label的位置
        self.labelTitle.frame = CGRectMake(self.plusImageView.frame.origin.x+self.plusImageView.frame.size.width + 5/*space*/, 0, self.contentView.frame.size.width - self.plusImageView.frame.origin.x - self.plusImageView.frame.size.width - 5 - 5/*space*/, self.contentView.frame.size.height);
        
        //underline
        self.underLine.frame = CGRectMake(x, self.contentView.frame.size.height - 0.5, self.contentView.frame.size.width - x, 0.5);
        self.underLine.backgroundColor = [UIColor colorWithRed:242/255.f green:244/255.f blue:246/255.f alpha:1];
        
    } else {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width, kRootTreeCellHeight);
        
        self.plusImageView.hidden = YES;
        
        //设置头像的位置
        CGFloat iconWidth = kRootTreeCellHeight - 10;
        self.avatarImageView.frame = CGRectMake(x, kRootTreeCellHeight/2.f - iconWidth/2.f, iconWidth, iconWidth);
        
        //这是label
        self.labelTitle.frame = CGRectMake(self.avatarImageView.frame.origin.x+self.avatarImageView.frame.size.width + 5/*space*/, 0, self.contentView.frame.size.width - self.avatarImageView.frame.origin.x - self.avatarImageView.frame.size.width - 5 - 5/*space*/, self.contentView.frame.size.height);
        
        //underline
        self.underLine.frame = CGRectMake(x, self.contentView.frame.size.height - 0.5, self.contentView.frame.size.width - x, 0.5);
        self.underLine.backgroundColor = [UIColor colorWithRed:242/255.f green:244/255.f blue:246/255.f alpha:1];
    }
}

@end
