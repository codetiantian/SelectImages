//
//  PhotoCell.h
//  SelectPhoto
//
//  Created by wangtian on 15/7/23.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPhotoModel.h"
#define PhotoCell_Identifier @"PhotoCell"
#define PhotoCell_Size CGSizeMake(90, 130)

@interface PhotoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

- (void)configueCellWithModel:(SPhotoModel *)model;

@end
