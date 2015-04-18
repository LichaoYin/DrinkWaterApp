//
//  ViewController.m
//  Timer_Notification_App
//
//  Created by Lichao Yin on 4/8/15.
//  Copyright (c) 2015 Lichao Yin. All rights reserved.
//
//  Test For GitHub

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL) addLocalNotification {
    // Local notification
    UILocalNotification* local_notification = [[UILocalNotification alloc] init];
    // the instance should not be nil
    if (local_notification == nil)
        return NO;
    
    local_notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    local_notification.alertBody = @"Drink water !!!!";
    local_notification.hasAction = NO;
    local_notification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:local_notification];
    return YES;
}

// Time format converter
- (NSString *) timeFormatted:(int)totalSeconds {
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}

// Send notification every 10 seconds
- (void) substractTime {
    self.seconds += 1;
    self.timeLabel.text = [self timeFormatted:self.seconds];
    if (self.seconds == 10) {
        self.seconds = 0;
        [self addLocalNotification];
    }
}

- (void) initViewController {
    self.seconds = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(substractTime) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drinkButtonPressed {
//    [self.timer invalidate];
    self.seconds = -1;
//    [self setTimer:[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(substractTime) userInfo:nil repeats:YES]];
}

@end
