//
//  EditViewController.m
//  RemindMe
//
//  Created by James Lapinski on 2/28/17.
//  Copyright © 2017 6thManApps. All rights reserved.
//

#import "EditViewController.h"

#import "ReminderTableViewController.h"


@interface EditViewController ()
@property (nonatomic) UIButton *saveButton;
@property (nonatomic) UIButton *deleteButton;
@property (nonatomic) UITextField *editReminderTextField;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.saveButton = [[UIButton alloc] init];
    self.saveButton.frame = CGRectMake(90, 200, 200, 40);
    self.saveButton.backgroundColor = [UIColor blueColor];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveButton];
    
    self.deleteButton = [[UIButton alloc] init];
    self.deleteButton.frame = CGRectMake(90, 260, 200, 40);
    self.deleteButton.backgroundColor = [UIColor redColor];
    [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    [self.deleteButton addTarget:self action:@selector(deleteButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.deleteButton];
    
    self.editReminderTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 100, 200, 40)];
    self.editReminderTextField.backgroundColor = [UIColor yellowColor];
    self.editReminderTextField.text = self.editedReminder.reminderString;
    [self.view addSubview: self.editReminderTextField];
}

- (void) saveButtonPressed{
    // Send the text from textfield to table
    self.editedReminder.reminderString = self.editReminderTextField.text;
    [self.delegate editViewController:self savedReminder:self.editedReminder];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"editButton pressed");
}

- (void) deleteButtonPressed{
    NSLog(@"deleteButton pressed");
    self.editReminderTextField.text = @"";
    [self.delegate editViewController:self deletedReminder:self.editedReminder];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
