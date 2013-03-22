//
//  RecordingTableViewController.h
//  Record
//
//  Created by wang  on 13-3-21.
//  Copyright (c) 2013年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RecordingTableViewController : UITableViewController <AVAudioPlayerDelegate>

@property (nonatomic, retain) NSArray *recordList;

@end
