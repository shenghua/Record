//
//  RecordingTableViewCell.m
//  Record
//
//  Created by wang  on 13-3-21.
//  Copyright (c) 2013年 wang. All rights reserved.
//

#import "RecordingTableViewCell.h"

@implementation RecordingTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 7, 70, 30)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)configurePlayerButton
{
    PlayButton *button = [PlayButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"play" forState:UIControlStateNormal];
    [button setTitle:@"pause" forState:UIControlStateHighlighted];
    [button setFrame:CGRectMake(20, 10, 50, 50)];
    self.playButton = button;
    [self.contentView addSubview:self.playButton];
    [button release];
}

- (void)dealloc
{
    [self.playButton release];
    [self.titleLabel release];
    [super dealloc];
}

@end
