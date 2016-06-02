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
    
    _musics = [YFMusic objectArrayWithFile:@"Musics.plist"];
    _playingMusic = _musics[0];
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

@end
