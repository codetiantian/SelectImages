//
//  SelectPhotoViewController.h
//  SelectPhoto
//
//  Created by wangtian on 15/7/23.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCell.h"

@interface SelectPhotoViewController : UIViewController

/**
 *  选择完图片回调block  
 */
@property (nonatomic, copy) void(^selectPhotoBlock)(NSMutableArray *photoModelArray);

/**
 *  点击拍摄  或者  从相册选择  1拍摄 2 从相册选择 
 */
@property (nonatomic, copy) void(^setClickBtnBlock)(NSInteger clickIndex);

/**
 *  显示或者隐藏视图
 */
- (void)showOrHiddenSelectPhotoView;

/**
 *  释放自己
 */
- (void)releaseSelf;


@end
