//
//  Game.m
//  demo1
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Game.h"
@interface Game()

@property(nonatomic,assign)NSInteger oldindex;

@property(nonatomic,strong)NSMutableArray *tapCard;
@end
@implementation Game
- (instancetype)initWithCardCount:(NSInteger)count inPoker:(Poker *)poker
{
    self = [super init];
    self.oldindex = 100;
    self.score = 0;
    self.gameOver = NO;
    self.allRandomCards = [[NSMutableArray alloc]init];
    self.tapCard = [[NSMutableArray alloc]init];
    if (self) {
        //根据需要的牌数随机抽取牌
        for (int i = 0; i < count; i++) {
            //随机获取牌的下标
            int index = arc4random()%poker.arr.count;
            //从扑克中取出 随机的牌
            Card *card = poker.arr[index];
            [self.allRandomCards addObject:card];
            //把抽取的牌 从扑克中移除
            [poker.arr removeObject:card];
        }
        for(Card *card in self.allRandomCards){
            NSLog(@"card = %@",card.cardInfo);
        }
    }
    return self;
}

-(void)tapCardAtIndex:(NSInteger)index
{
    
    //根据索引取出点中的牌
    Card *card = self.allRandomCards[index];
    if(card.isMached==YES)
        return;
    //脸朝上
    if (card.isFaceUP ) {
        card.faceUP = NO;
        if ([self.tapCard containsObject:card]==YES) {
            [self.tapCard removeObject:card];
            
        }
        for(Card *carde in self.tapCard){
            carde.faceUP=NO;
            [self.tapCard removeObject:card];
        }
        return;
    }
    //脸朝下
    //把牌反过来，并存入已翻开牌数组
    card.faceUP = YES;
    if ([self.tapCard containsObject:card]==NO) {
        [self.tapCard addObject:card];
        
    }
    //计算翻开牌数量
    int cardCount = 0;
    for (Card* carde in self.allRandomCards) {
        if (carde.isFaceUP ==YES&&carde.isMached==NO){
            cardCount++;
        }
        if (carde.isMached ==YES && [self.tapCard containsObject:carde]) {
            [self.tapCard removeObject:carde];
            
        }
    }
    //匹配花色和点数
    if (cardCount>1) {
        if (self.oldindex<self.allRandomCards.count) {
            Card *cardold = self.allRandomCards[self.oldindex];
            
//            NSString* a1 = [card.cardInfo substringToIndex:1];
//            NSString* a2 = [card.cardInfo substringFromIndex:1];
//            NSString* b1 = [cardold.cardInfo substringToIndex:1];
//            NSString* b2 = [cardold.cardInfo substringFromIndex:1];

            
            //花色相同加1分
            //数字相同加4分
            int addScoreSuit = 1;
            int addScoreRank = 4;
            if ([card compareSuit:cardold]) {
                self.score+=addScoreSuit;
            }
            if ([card compareRank:cardold]) {
                self.score+=addScoreRank;
            }
            
            if([card compareRank:cardold]||[card compareSuit:cardold]){
                
                card.matched=YES;
                cardold.matched = YES;
                for (Card* carde in self.tapCard) {
                    if(carde.isMached==NO)carde.faceUP =NO;
                }
                [self.tapCard removeAllObjects];
                self.oldindex = 100;
            }
            
        }
        
       
        
    }

    
        //翻3张向上时，把前两张翻回去
    if (self.tapCard.count>2) {
        NSMutableArray *remove= [NSMutableArray array];
        for (Card *carde in self.tapCard) {
            if ([card isEqual:carde]==NO) {
                [remove addObject:carde];
                
                carde.faceUP = NO;
            }
            
        }
        
        [self.tapCard removeObjectsInArray:remove];
    }
    self.oldindex = index;
    
     //游戏结束
    NSMutableArray *remain = [NSMutableArray array];
    for (Card *carde in self.allRandomCards) {
        if (carde.isMached==NO) {
            [remain addObject:carde];
        }
    }
    int samethings=0;
    for (Card *carde in remain) {
        for (Card *carde2 in remain) {
            if ([carde2.cardInfo isEqualToString:carde.cardInfo]==NO) {
//                NSString* a1 = [carde.cardInfo substringToIndex:1];
//                NSString* a2 = [carde.cardInfo substringFromIndex:1];
//                NSString* b1 = [carde2.cardInfo substringToIndex:1];
//                NSString* b2 = [carde2.cardInfo substringFromIndex:1];
//                if ([a1 isEqualToString:b1]) {
//                    samethings++;
//                }
//                if([a2 isEqualToString:b2]){
//                    samethings++;
//                }
                if ([carde compareSuit:carde2]||[carde2 compareRank:carde]) {
                    samethings++;
                }
            
            }
        }
        
    }
    if (samethings==0) {
        self.gameOver =YES;
        for (Card *carde in self.allRandomCards) {
            carde.faceUP = YES;
        }
    }
}


@end
