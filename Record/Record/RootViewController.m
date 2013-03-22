//
//  RootViewController.m
//  Record
//
//  Created by wang  on 13-3-21.
//  Copyright (c) 2013年 wang. All rights reserved.
//

#import "RootViewController.h"
#import "RecordingTableViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    UIView *baseView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = baseView;
    
    UIButton *item = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [item setTitle:@"列表" forState:UIControlStateNormal];
    [item setFrame:CGRectMake(0, 0, 50, 30)];
    [item addTarget:self action:@selector(pushRecordTableViewController) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:item];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    UIButton *recordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [recordButton setTitle:@"record" forState:UIControlStateNormal];
    [recordButton setTitle:@"recording" forState:UIControlStateHighlighted];
    [recordButton setFrame:CGRectMake(90, 100, 140, 40)];
    [recordButton addTarget:self action:@selector(startRecord) forControlEvents:UIControlEventTouchDown];
    [recordButton addTarget:self action:@selector(stopRecord) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:recordButton];
    [recordButton release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *paths  =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *docDir = [paths objectAtIndex:0];
    self.filePath = [docDir stringByAppendingPathComponent:[NSString stringWithFormat:@"RecordedFile"]];

    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:self.filePath isDirectory:&isDir];
    bool isCreated = false;
    if ( !(isDir == YES && existed == YES) )
    {
        isCreated = [fileManager createDirectoryAtPath:self.filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    NSError *sessionError;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    if(session == nil)
        NSLog(@"Error creating session: %@", [sessionError description]);
    else
        [session setActive:YES error:nil];
}

- (void)viewDidUnload
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtURL:[NSURL fileURLWithPath:self.filePath] error:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)pushRecordTableViewController
{
    RecordingTableViewController *recordingTableVC = [[RecordingTableViewController alloc] init];
    [self.navigationController pushViewController:recordingTableVC animated:YES];
    [recordingTableVC release];
}

- (void)startRecord
{
    NSString *now = [NSString stringWithFormat:@"%@.caf", [[NSDate dateWithTimeIntervalSinceNow:0] description]];
    NSURL *url = [NSURL fileURLWithPath:[self.filePath stringByAppendingPathComponent: now]];

    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:44100.0], AVSampleRateKey,[NSNumber numberWithInt:kAudioFormatMPEG4AAC], AVFormatIDKey,[NSNumber numberWithInt:1], AVNumberOfChannelsKey,nil];
    
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:nil];
    [self.recorder prepareToRecord];
    [self.recorder record];
}

- (void)stopRecord
{
    [self.recorder stop];
}

- (void)play
{
//    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recordedFile error:nil];
//    [player play];
}

- (void)dealloc
{
    [self.recorder release];
    [super dealloc];
}

@end
