//
//  YFMusicPlayer.m
//  YFMusicPlayer
//
//  Created by 黄志伟 on 16/6/1.
//  Copyright © 2016年 黄志伟. All rights reserved.
//

#import "YFMusicPlayer.h"

@implementation YFMusicPlayer
static NSMutableDictionary *_soudIDs;
static NSMutableDictionary *_players;

+ (void)initialize
{
    _soudIDs = [NSMutableDictionary dictionary];
    _players = [NSMutableDictionary dictionary];
}
+ (AVAudioPlayer*)playMusicWithFileName:(NSString*)filename{
    //创建空的播放器
    AVAudioPlayer *player = nil;
    //从字典中区
    player = _players[filename];
    //如果为空加入字典
    if (player == nil) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (url == nil) {
            return nil;
        }
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [_players setObject:player forKey:filename];
        //准备播放
        [player prepareToPlay];
        
    }
    [player play];
    return player;
    
}


+ (void)pauseMusicWithFileName:(NSString *)fileName
{
    // 1.从字典中取出播放器
    AVAudioPlayer *player = _players[fileName];
    
    // 2.暂停音乐
    if (player) {
        [player pause];
    }
}

+ (void)stopMusicWithFileName:(NSString *)fileName
{
    // 1.从字典中取出播放器
    AVAudioPlayer *player = _players[fileName];
    
    // 2.停止音乐
    if (player) {
        [player stop];
        [_players removeObjectForKey:fileName];
        player = nil;
    }
}

+ (void)playSoundWithSoundName:(NSString *)soundName
{
    // 1.创建soundID = 0
    SystemSoundID soundID = 0;
    
    // 2.从字典中取出soundID
    soundID = [_soudIDs[soundName] unsignedIntValue];;
    
    // 3.判断soundID是否为0
    if (soundID == 0) {
        // 3.1生成soundID
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        AudioServicesCreateSystemSoundID(url, &soundID);
        
        // 3.2将soundID保存到字典中
        [_soudIDs setObject:@(soundID) forKey:soundName];
        
    }
    
    // 4.播放音效
    AudioServicesPlaySystemSound(soundID);
}//
/*+(void)playmusicWithFileName:(NSString *)filename{
    //创建空的播放器
    AVAudioPlayer *player = nil;
    //从字典中区
    player = _players[filename];
    //如果为空加入字典
    if (player == nil) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [_players setObject:player forKey:filename];
        //准备播放
        [player prepareToPlay];
        
    }
    [player play];
    
}*/

@end
