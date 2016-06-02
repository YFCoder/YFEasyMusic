//
//  YFMusicPlayer.h
//  YFMusicPlayer
//
//  Created by 黄志伟 on 16/6/1.
//  Copyright © 2016年 黄志伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface YFMusicPlayer : NSObject
+ (AVAudioPlayer*)playMusicWithFileName:(NSString*)filename;
// 播放音效
+ (void)playSoundWithSoundName:(NSString *)soundName;
//播放音乐
+(void)playmusicWithFileName:(NSString *)filename;

//暂停
+ (void)pauseMusicWithFileName:(NSString *)fileName;
//停止
+ (void)stopMusicWithFileName:(NSString *)fileName;
@end
