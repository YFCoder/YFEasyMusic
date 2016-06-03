//
//  YFMusicTools.h
//  YFEasyMusic(黄鱼简音乐)
//
//  Created by 黄志伟 on 16/6/2.
//  Copyright © 2016年 黄志伟. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YFMusic;

@interface YFMusicTools : NSObject
//返回数组音乐
+ (NSArray*)musics;

//返回正在播放的Music
+ (YFMusic*)plsyingmusic;

//设置音乐
+ (void)setUpMusic:(YFMusic*)music;
//设置上下手音乐
+ (void)nextMusic;
+ (void)preMusic;
@end
