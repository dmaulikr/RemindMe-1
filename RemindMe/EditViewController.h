//
//  EditViewController.h
//  RemindMe
//
//  Created by James Lapinski on 2/28/17.
//  Copyright © 2017 6thManApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"
@protocol EditViewControllerDelegate;
@interface EditViewController : UIViewController
@property (nonatomic, weak) id<EditViewControllerDelegate> delegate;

@property (nonatomic) Reminder *editedReminder;

@end

@protocol EditViewControllerDelegate <NSObject>

- (void)editViewController:(EditViewController *)editVC savedReminder:(Reminder *)reminder;
- (void)editViewController:(EditViewController *)editVC deletedReminder:(Reminder *)reminder;

@end
