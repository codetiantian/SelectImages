//
//  RequestResult.m
//  MSIVideo
//
//  Created by wangtian on 15-1-23.
//  Copyright (c) 2015年 nidom. All rights reserved.
//

#import "RequestResult.h"

@implementation RequestResult

- (instancetype)initWithState:(BOOL)state andDescripe:(NSString *)descripe
{
    if (self = [super init]) {
        self.state = state;
        self.descripe = descripe;
    }
    
    return self;
}

@end
