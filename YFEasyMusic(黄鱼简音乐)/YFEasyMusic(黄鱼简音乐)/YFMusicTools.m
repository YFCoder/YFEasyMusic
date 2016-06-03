//
//  YFMusicTools.m
//  YFEasyMusic(黄鱼简音乐)
//
//  Created by 黄志伟 on 16/6/2.
//  Copyright © 2016年 黄志伟. All rights reserved.
//

#import "YFMusicTools.h"
#import "YFMusic.h"
#import "MJExtension.h"

@implementation YFMusicTools

static NSArray* _musics;
static YFMusic* _playingMusic;
//第一次加载类的时候调用
+(void)initialize{
    if (_musics == nil||_playingMusic == nil) {
        _musics = [YFMusic objectArrayWithFilename:@"Musics.plist"];
        _playingMusic = _musics[3];
    }
  
    
}

+ (NSArray *)musics{
    return _musics;
    
}
+ (YFMusic *)plsyingmusic{
 
    return  _playingMusic;
}
+ (void)setUpMusic:(YFMusic *)music{
    
    _playingMusic = music;
}
+ (void)nextMusic{
    NSInteger currrenIndex = [_musics indexOfObject:_playingMusic];
    currrenIndex = currrenIndex+1;
    if (currrenIndex>=_musics.count) {
        currrenIndex = 0;
    }
    _playingMusic = _musics[currrenIndex];
    
}
+ (void)preMusic{
    NSInteger currentIndex = [_musics indexOfObject:_playingMusic];
    currentIndex = currentIndex - 1;
    if (currentIndex < 0) {
        currentIndex = _musics.count - 1;
    }
    _playingMusic = _musics[currentIndex];
}

@end
