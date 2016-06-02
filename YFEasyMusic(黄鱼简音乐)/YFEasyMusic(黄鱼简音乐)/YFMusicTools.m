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

static NSArray *_musics;
//第一次加载类的时候调用
+(void)initialize{
    
    _musics = [YFMusic objectArrayWithFile:@"Musics.plist"];
}

+ (NSArray *)musics{
    
}

@end
