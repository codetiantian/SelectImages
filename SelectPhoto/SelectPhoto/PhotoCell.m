//
//  PhotoCell.m
//  SelectPhoto
//
//  Created by wangtian on 15/7/23.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (void)awakeFromNib
{
    // Initialization code
    [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"noSelect"] forState:(UIControlStateNormal)];
    [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"select"] forState:(UIControlStateSelected)];
}

- (void)configueCellWithModel:(SPhotoModel *)model
{
    self.iconImageView.image = model.icon;
    self.selectBtn.selected = model.isSelect;
}

@end
