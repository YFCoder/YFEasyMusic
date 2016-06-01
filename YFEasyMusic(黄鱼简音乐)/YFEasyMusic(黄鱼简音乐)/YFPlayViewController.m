//
//  YFPlayViewController.m
//  YFEasyMusic(黄鱼简音乐)
//
//  Created by 黄志伟 on 16/6/1.
//  Copyright © 2016年 黄志伟. All rights reserved.
//

#import "YFPlayViewController.h"
#import "Masonry.h"

@interface YFPlayViewController ()
//歌手的背景图
@property (weak, nonatomic) IBOutlet UIImageView *albumview;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

@end

@implementation YFPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //实现毛玻璃的效果
    [self setUpBlur];
    //设置滑块
    [self setSlider];
    
    
    
}
- (void)setSlider{
    [self.progressSlider setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateNormal];
}
- (void)setUpBlur{
    UIToolbar *toolbar = [[UIToolbar alloc]init];
    [self.albumview addSubview:toolbar];
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.translatesAutoresizingMaskIntoConstraints = NO;
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.albumview);
        
    }];
    
    
}



@end
