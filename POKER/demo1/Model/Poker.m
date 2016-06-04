//
//  Poker.m
//  demo1
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Poker.h"

@implementation Poker

- (instancetype)init
{
    self = [super init];
    self.arr = [NSMutableArray array];
    
//    if (self) {
//        for (int i = 0; i<[Card allsuit].count; i++) {
//            for (int j=0; j<[Card allrank].count; j++) {
//                
//            }
//        }
//    }
//用for in会更简单
    for(NSString *suit in [Card allsuit])
    {
        for (NSString *rank in [Card allrank]) {
            //根据花色和点数创建Card对象
            Card *card = [Card cardWithSuit:suit andRank:rank];
            //把创建好的牌放到扑克中
            [self.arr addObject:card];
        }
    }
    for(Card *card in self.arr){
        NSLog(@"card = %@",card.cardInfo);
    }
    
    return self;
}

@end
