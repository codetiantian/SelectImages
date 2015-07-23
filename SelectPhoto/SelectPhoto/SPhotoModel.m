//
//  SPhotoModel.m
//  SelectPhoto
//
//  Created by wangtian on 15/7/23.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "SPhotoModel.h"
#import <AssetsLibrary/AssetsLibrary.h>
@implementation SPhotoModel


+ (void)getLocalVideoWithFinishBlock:(TYRequestFinishBlock)finishBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableArray *data = [[NSMutableArray alloc] init];
        ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
            
            if (group != nil) {
                
                [data addObject:group];
            }
            else{
                
                //从读取到的资源里面获得 视频信息
                [self getVideoWithDataArray:data andFinishBlock:finishBlock];
            }
        };
        
        ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error){
            
            //获得视频信息失败的处理
            [self getLocalVideoFailureWithError:error andFinishBlock:finishBlock];
        };
        
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc]  init];
        
        [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll
         
                                     usingBlock:listGroupBlock failureBlock:failureBlock];
    });
}

+ (void)getVideoWithDataArray:(NSMutableArray *)data andFinishBlock:(TYRequestFinishBlock)finishBlock
{
    NSMutableArray *localPhotoArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < data.count; i++) {
        
        id obj = data[i];
        [obj enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            if ([result thumbnail] != nil) {
                
                if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]){
                    
                    SPhotoModel *model = [[SPhotoModel alloc] init];
                    model.isSelect = NO;
                    model.icon = [UIImage imageWithCGImage:[result thumbnail]];
                    CGSize imageSize = model.icon.size;
                    model.bili = imageSize.width / imageSize.height;
                    [localPhotoArray addObject:model];
                }
            }
        }];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        
        RequestResult *result = [[RequestResult alloc] init];
        result.dataDic = localPhotoArray;
        result.state = YES;
        if (localPhotoArray.count == 0) {
            
            result.state = NO;
            result.descripe = @"没有发现本地图片";
        }
        finishBlock(result);
    });
}

#pragma mark - 获得本地视频信息失败处理
+ (void)getLocalVideoFailureWithError:(NSError *)error andFinishBlock:(TYRequestFinishBlock)finishBlock
{
    NSString *errorMessage = nil;
    switch ([error code]) {
            
        case ALAssetsLibraryAccessUserDeniedError:
            
        case ALAssetsLibraryAccessGloballyDeniedError:
            
            errorMessage = @"用户拒绝访问相册,请在<隐私>中开启";
            break;
            
        default:
            errorMessage = @"加载本地照片出错，请稍后再试";
            break;
            
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        finishBlock(TYRequestResult(NO, errorMessage));
    });
}


@end
