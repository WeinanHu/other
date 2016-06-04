//
//  GameViewController.m
//  demo1
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButton;
@property(nonatomic,strong)Game *game;
@property(nonatomic,strong)Poker *poker;
@end

@implementation GameViewController
- (IBAction)clickCardButton:(UIButton *)sender {
    NSInteger index;
    index = [self.allButton indexOfObject:sender];
    
    [self.game tapCardAtIndex:index];
    [self showCards];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //srand((unsigned)time(0));
    Poker *poker = [[Poker alloc]init];
    self.game = [[Game alloc]initWithCardCount:self.allButton.count inPoker:poker];
    [self showCards];
    // Do any additional setup after loading the view from its nib.
}
-(void)showCards{
    for (int i= 0; i<self.allButton.count; i++) {
        //逐个取出并设置title和背景
        UIButton *button = self.allButton[i];
        Card *card = self.game.allRandomCards[i];
        [button setTitle:card.isFaceUP?card.cardInfo:@"" forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:card.isFaceUP?@"cardfront":@"cardback"] forState:UIControlStateNormal];
        if (card.isMached==YES) {
            button.enabled =NO;
        }else{
            button.enabled =YES;
        }
        
    }
    if (self.game.isGameOver == YES) {
        for (UIButton *button1 in self.allButton) {
            button1.userInteractionEnabled = NO;
        }
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(170, 424, 115, 48)];
        button.titleLabel.numberOfLines = 0;
        button.backgroundColor =[UIColor blueColor];
        [button setTitle:@"游戏结束\n重新开始?" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(reStartGame) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    self.pointLabel.text = [NSString stringWithFormat:@"得分：%ld",self.game.score];
}

-(void)reStartGame{
    
    Poker *poker = [[Poker alloc]init];
    self.game = [[Game alloc]initWithCardCount:self.allButton.count inPoker:poker];
    for (UIButton *button1 in self.allButton) {
        button1.userInteractionEnabled = YES;
    }
    [self showCards];
    [self.view.subviews.lastObject removeFromSuperview];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
