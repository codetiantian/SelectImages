//
//  RequestResult.h
//  MSIVideo
//
//  Created by wangtian on 15-1-23.
//  Copyright (c) 2015年 nidom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestResult : NSObject

@property (nonatomic, assign) BOOL state;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *descripe;
@property (nonatomic, strong) id dataDic;

- (instancetype)initWithState:(BOOL)state andDescripe:(NSString *)descripe;

@end
