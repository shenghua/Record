//
//  RecordingTableViewCell.h
//  Record
//
//  Created by wang  on 13-3-21.
//  Copyright (c) 2013年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayButton.h"

@interface RecordingTableViewCell : UITableViewCell

@property (nonatomic, retain) PlayButton *playButton;
@property (nonatomic, retain) UILabel *titleLabel;

- (void)configurePlayerButton;

@end
