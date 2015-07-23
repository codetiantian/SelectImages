//
//  SPhotoModel.h
//  SelectPhoto
//
//  Created by wangtian on 15/7/23.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestResult.h"
#import <UIKit/UIKit.h>

typedef void(^TYRequestFinishBlock)(RequestResult *result);
#define  TYRequestResult(state,descripe) [[RequestResult alloc] initWithState:state andDescripe:descripe]  //请求结果  state:是否成功   descripe:描述

@interface SPhotoModel : NSObject

@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, assign) CGFloat bili;

+ (void)getLocalVideoWithFinishBlock:(TYRequestFinishBlock)finishBlock;

@end
