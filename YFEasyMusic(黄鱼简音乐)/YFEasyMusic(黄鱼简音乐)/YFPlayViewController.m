//
//  YFPlayViewController.m
//  YFEasyMusic(黄鱼简音乐)
//
//  Created by 黄志伟 on 16/6/1.
//  Copyright © 2016年 黄志伟. All rights reserved.
//

#import "YFPlayViewController.h"
#import "Masonry.h"
#import "YFMusic.h"
#import "YFMusicTools.h"
#import "YFMusicPlayer.h"

@interface YFPlayViewController ()
//歌手的背景图
@property (weak, nonatomic) IBOutlet UIImageView *albumview;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *songLable;
@property (weak, nonatomic) IBOutlet UILabel *singerLable;

@end

@implementation YFPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //实现毛玻璃的效果
    [self setUpBlur];
    //设置滑块
    [self setSlider];
    //播放默认音乐并且搭建界面
    [self playmusic];

    
    
}
- (void)playmusic{
    //取出要播放的音乐
    YFMusic* playingmusic = [YFMusicTools plsyingmusic];
    //设置界面信息
    self.songLable.text = playingmusic.name;
    self.singerLable.text = playingmusic.singer;
    self.iconView.image = [UIImage imageNamed:playingmusic.icon];
    self.albumview.image = [UIImage imageNamed:playingmusic.icon];
    //播放音乐
    [YFMusicPlayer playmusicWithFileName:playingmusic.filename];
    
    
}
- (void)viewWillLayoutSubviews{
    //实现歌手图片圆角
    
    [self setCornner];
}
-(void)setCornner{
    self.iconView.layer.cornerRadius = self.iconView.frame.size.width * 0.5;
    self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.iconView.layer.borderWidth = 6;
    
    
    
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
