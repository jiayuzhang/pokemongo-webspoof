//
//  ViewController.m
//  pokemon-webspoof
//
//  Created by iam4x on 15/07/2016.
//  Copyright © 2016 iam4x. All rights reserved.
//

#import "ViewController.h"
#import "AVFoundation/AVFoundation.h"
#import "AudioToolbox/AudioToolbox.h"

@interface ViewController ()

@end

@implementation ViewController {
    AVAudioPlayer *_silenceBgPlayer;   // strong reference
}

- (void)viewDidLoad {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"silence" ofType:@"mp3"]];
    _silenceBgPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    _silenceBgPlayer.numberOfLoops = -1;
    [_silenceBgPlayer play];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
