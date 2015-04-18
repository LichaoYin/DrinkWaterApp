//
//  ViewController.h
//  Timer_Notification_App
//
//  Created by Lichao Yin on 4/8/15.
//  Copyright (c) 2015 Lichao Yin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSTimer * timer;
@property IBOutlet UILabel * timeLabel;
@property IBOutlet UIButton * drinkButton;
@property int seconds;

- (IBAction)drinkButtonPressed;
@end

