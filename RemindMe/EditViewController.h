//
//  EditViewController.h
//  RemindMe
//
//  Created by James Lapinski on 2/28/17.
//  Copyright © 2017 6thManApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

@interface EditViewController : UIViewController

@property (nonatomic) UITextField *editReminderTextField;
@property (nonatomic) Reminder *editedReminder;

@end
