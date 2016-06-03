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
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLable;
@property(nonatomic,strong) NSTimer* progressTimer;
@property(nonatomic,weak) AVAudioPlayer *currentPlayer;
@property (weak, nonatomic) IBOutlet UIButton *startOrStopButton;

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
     AVAudioPlayer *currentPlayer = [YFMusicPlayer playMusicWithFileName:playingmusic.filename];
    self.currentPlayer = currentPlayer;
    [self deleteProgressTimer];
    [self addProgressTimer];
    self.startOrStopButton.selected = self.currentPlayer.isPlaying;
    
    
    
}
- (void)viewWillLayoutSubviews{
    //实现歌手图片圆角
    
    [self setCornner];
}

#pragma mark -滑块的事件处理
- (IBAction)start:(id)sender {
    
    
    //开始滑动移除定时器
    
    [self deleteProgressTimer];
}

- (IBAction)end:(id)sender {
    self.currentPlayer.currentTime = self.progressSlider.value * self.currentPlayer.duration;
    
    [self addProgressTimer];
}
- (IBAction)progressValueChange:(id)sender {
    //跟新时间
    self.currentTimeLable.text = [self stringWithNSTimer:self.progressSlider.value * self.currentPlayer.duration];
}
#pragma mark -开始与停止按钮的监听
- (IBAction)playStopButton:(id)sender {
    
}





- (NSString*)stringWithNSTimer:(NSTimeInterval)time{
    
    NSInteger min = time / 60;
    NSInteger secd = (int)round(time) % 60;
    return  [NSString stringWithFormat:@"%02ld:%02ld",min,secd];
    
}
//进度条时间的管理
- (void)addProgressTimer{
    [self updateSliderTime];
    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSliderTime)  userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.progressTimer forMode:NSRunLoopCommonModes];
    
}
- (void)deleteProgressTimer{
    [self.progressTimer invalidate];
    self.progressTimer = nil;
    
}

- (void)updateSliderTime{
    self.currentTimeLable.text = [self stringWithNSTimer:self.currentPlayer.currentTime];
    self.totalTimeLable.text =[self stringWithNSTimer:self.currentPlayer.duration];
    self.progressSlider.value = self.currentPlayer.currentTime / self.currentPlayer.duration;


    
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
