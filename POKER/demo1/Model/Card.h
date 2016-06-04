//
//  Card.h
//  demo1
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
//是否面朝上
//修改getter方法为isFaceUP
@property(nonatomic,strong,readonly) NSString* cardInfo;

@property(nonatomic,assign,getter=isFaceUP)BOOL faceUP;
//是否匹配过
@property(nonatomic,assign,getter=isMached)BOOL matched;

-(BOOL)compareSuit:(Card*)otherCard;
-(BOOL)compareRank:(Card*)otherCard;
- (instancetype)initWithSuit:(NSString*)suit andRank:(NSString*)rank;

+(instancetype)cardWithSuit:(NSString*)suit andRank:(NSString*)rank;
//返回所有花色的字符串
+(NSArray*)allsuit;
//返回每种花色的牌面大小
+(NSArray*)allrank;
@end
