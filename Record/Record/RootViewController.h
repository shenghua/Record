//
//  RootViewController.h
//  Record
//
//  Created by wang  on 13-3-21.
//  Copyright (c) 2013年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVAudioRecorder;
@interface RootViewController : UIViewController

@property (nonatomic, retain) NSString *filePath;
@property (nonatomic, retain) AVAudioRecorder *recorder;

@end
