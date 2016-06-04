//
//  MineModel.m
//  winMine
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 mrHu. All rights reserved.
//

#import "MineModel.h"
@interface MineModel()
@property NSString *state;
@property NSString *hasMine;
@end

@implementation MineModel
-(instancetype)initWithState:(NSString*)state hasMine:(NSString*)hasMine{
    if (self = [super init]) {
        self.state = state;
        self.hasMine = hasMine;
    }
    return self;
}

@end
