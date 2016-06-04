//
//  WinMineViewController.m
//  winMine
//
//  Created by tarena on 16/3/8.
//  Copyright © 2016年 mrHu. All rights reserved.
//

#import "WinMineViewController.h"

@interface WinMineViewController ()

@end

@implementation WinMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rec =[[UIScreen mainScreen]bounds];
    NSLog(@"w=%f h = %f",rec.size.width,rec.size.height);
    
    
    
    NSArray *view = [[NSBundle mainBundle]loadNibNamed:@"MineView" owner:nil options:nil];
    NSLog(@"%@",view);
    //[view setFrame:CGRectMake(0, 0, 20, 20)];
    
    //[self.view addSubview: view];
    
    // Do any additional setup after loading the view from its nib.
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
