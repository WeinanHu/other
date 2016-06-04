//
//  Game.h
//  demo1
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poker.h"
@interface Game : NSObject
//随机抽取要用的牌 放到数组中
@property(nonatomic,strong) NSMutableArray *allRandomCards;
//分数
@property(nonatomic,assign) NSInteger score;
@property(nonatomic,assign,getter=isGameOver) BOOL gameOver;
//参数1：抽取多少张  2：从扑克中抽取
-(instancetype)initWithCardCount:(NSInteger)count inPoker:(Poker*)poker;

-(void)tapCardAtIndex:(NSInteger)index;
@end
