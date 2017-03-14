//
//  ViewController.h
//  RemindMe
//
//  Created by James Lapinski on 2/17/17.
//  Copyright © 2017 6thManApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddReminderViewController.h"
#import "EditViewController.h"

@protocol AddReminderViewControllerDelegate;

@interface ViewController : UIViewController <AddReminderViewControllerDelegate>
@property (nonatomic) NSMutableArray *reminderArray;
@end

