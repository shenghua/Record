//
//  PlayButton.h
//  Record
//
//  Created by wang  on 13-3-22.
//  Copyright (c) 2013年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVAudioPlayer;
@interface PlayButton : UIButton

@property (nonatomic, retain) AVAudioPlayer *player;

@end
