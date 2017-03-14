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
    NSLog(@"%@", self.navigationController.viewControllers);
    
}

- (void)addReminderButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
    
    Reminder *newReminder = [[Reminder alloc] init];
    newReminder.aString = self.reminderTextField.text;
    newReminder.reminderDate = [NSDate date];
    [self.delegate addReminderViewController:self createdReminder:newReminder];
    // 1. Go back to previous VC after button pressed
    // 2. Notify delegate of the reminder that we created
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
