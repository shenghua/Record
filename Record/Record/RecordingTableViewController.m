//
//  RecordingTableViewController.m
//  Record
//
//  Created by wang  on 13-3-21.
//  Copyright (c) 2013年 wang. All rights reserved.
//

#import "RecordingTableViewController.h"
#import "RecordingTableViewCell.h"

@implementation RecordingTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *paths  =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *filePath = [docDir stringByAppendingPathComponent:[NSString stringWithFormat:@"RecordedFile"]];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *fileList = [[NSArray alloc] init];
    fileList = [manager contentsOfDirectoryAtPath:filePath error:nil];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSString *file in fileList) {
        NSString *path = [filePath stringByAppendingPathComponent:file];
        if ([manager fileExistsAtPath:path]) {
            NSString *pathDetail = [filePath stringByAppendingPathComponent:file];
            NSDictionary *dictonary = [NSDictionary dictionaryWithObjectsAndKeys:file, @"name", pathDetail, @"url", nil];
            [array addObject:dictonary];
            [file release];
            [pathDetail release];
            [dictonary release];
            
        }
    }
    self.recordList = [[NSArray alloc] initWithArray:array copyItems:YES];
    NSLog(@"%@", [self.recordList description]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playAudio:(PlayButton *)button
{
    NSInteger index = button.tag;
    NSDictionary *item = [self.recordList objectAtIndex:index];
    
//    if (_audioPlayer == nil) {
//        _audioPlayer = [[AudioPlayer alloc] init];
//    }
//    
//    if ([_audioPlayer.button isEqual:button]) {
//        [_audioPlayer play];
//    } else {
//        [_audioPlayer stop];
//        
//        _audioPlayer.button = button;
//        _audioPlayer.url = [NSURL URLWithString:[item objectForKey:@"url"]];
//        
//        [_audioPlayer play];
//    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.recordList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *CellIdentifier = @"Cell";
    
    RecordingTableViewCell *cell = (RecordingTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[RecordingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell configurePlayerButton];
    }
    
    // Configure the cell..
    NSLog(@"%@", [self.recordList description]);
    NSDictionary *item = [self.recordList objectAtIndex:indexPath.row];
//    cell.titleLabel.text = [item objectForKey:@"name"];
//    cell.playButton.tag = indexPath.row;
//    [cell.playButton addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"play finish");
}

- (void)dealloc
{
    [self.recordList release];
    [super dealloc];
}

@end
