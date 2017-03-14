//
//  AddReminderViewController.h
//  RemindMe
//
//  Created by James Lapinski on 2/18/17.
//  Copyright © 2017 6thManApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

//Create a delegate here that has one callback function, ex. addreminderviewcontrollerdidcreatereminder. Parameter is going to be a reminder that is one string.

@protocol AddReminderViewControllerDelegate;

@interface AddReminderViewController : UIViewController

@property (nonatomic, weak) id<AddReminderViewControllerDelegate> delegate;


@end

@protocol AddReminderViewControllerDelegate <NSObject>

- (void)addReminderViewController:(AddReminderViewController *)vc
                  createdReminder:(Reminder *)reminder;
@end
