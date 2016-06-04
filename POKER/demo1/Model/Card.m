//
//  Card.m
//  demo1
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Card.h"
@interface Card()
//花色
@property(nonatomic,strong)NSString *suit;
//点数
@property(nonatomic,strong)NSString *rank;
@end
@implementation Card
- (instancetype)initWithSuit:(NSString*)suit andRank:(NSString*)rank
{
    
    self = [super init];
    if (self) {
        self.faceUP = NO;
        self.matched = NO;
        self.suit = suit;
        self.rank = rank;
        
    //    NSLog(@"%d",self.isFaceUP);
    }
    return self;
}


+ (instancetype)cardWithSuit:(NSString*)suit andRank:(NSString*)rank{
    return [[Card alloc]initWithSuit:suit andRank:rank];
}
-(NSString*)cardInfo{
    return [self.suit stringByAppendingString:self.rank];
}


-(BOOL)compareSuit:(Card*)otherCard{
    if ([self.suit isEqualToString:otherCard.suit]) {
        return YES;
    }
    return NO;
}
-(BOOL)compareRank:(Card*)otherCard{
    if ([self.rank isEqualToString:otherCard.rank]) {
        return YES;
    }
    return NO;
}

//返回所有花色的字符串
+(NSArray*)allsuit{
    return @[@"♠️",@"♥️",@"♣️",@"♦️"];
}
//返回每种花色的牌面大小
+(NSArray*)allrank{
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

@end
