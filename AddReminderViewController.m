//
//  AddReminderViewController.m
//  RemindMe
//
//  Created by James Lapinski on 2/18/17.
//  Copyright © 2017 6thManApps. All rights reserved.
//

#import "AddReminderViewController.h"
#import "Reminder.h"

@interface AddReminderViewController ()
@property (nonatomic) UITextField *reminderTextField;
@property (nonatomic) UIButton *addReminderButton;

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"Add Your Reminder";
    
    self.reminderTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 100, 200, 40)];
    self.reminderTextField.placeholder = @"Enter reminder here";
    self.reminderTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: self.reminderTextField];
    
    self.addReminderButton = [[UIButton alloc] init];
    self.addReminderButton.frame=CGRectMake(90, 200, 200, 40);
    self.addReminderButton.backgroundColor = [UIColor blueColor];
    [self.addReminderButton setTitle:@"Add" forState:UIControlStateNormal];
    [self.addReminderButton addTarget:self action:@selector(addReminderButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addReminderButton];    
}

- (void)addReminderButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
    Reminder *newReminder = [[Reminder alloc] init];
    newReminder.reminderString = self.reminderTextField.text;
    newReminder.reminderDate = [NSDate date];
    [self.delegate addReminderViewController:self createdReminder:newReminder];
}

@end
