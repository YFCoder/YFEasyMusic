//
//  YFPlayViewController.m
//  YFEasyMusic(黄鱼简音乐)
//
//  Created by 黄志伟 on 16/6/1.
//  Copyright © 2016年 黄志伟. All rights reserved.
//

#import "YFPlayViewController.h"

@interface YFPlayViewController ()
//歌手的背景图
@property (weak, nonatomic) IBOutlet UIImageView *albumview;

@end

@implementation YFPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //实现毛玻璃的效果
    [self setUpBlur];
    
    
}
- (void)setUpBlur{
    UIToolbar *toolbar = [[UIToolbar alloc]init];
    [self.albumview addSubview:toolbar];
    toolbar.translatesAutoresizingMaskIntoConstraints = NO;
    
    
}



@end
