//
//  ViewController.m
//  RemindMe
//
//  Created by James Lapinski on 2/17/17.
//  Copyright © 2017 6thManApps. All rights reserved.
//

#import "ViewController.h"
#import "AddReminderViewController.h"
#import "Reminder.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *reminderTableView;
@property (nonatomic) UIBarButtonItem *reminderButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect viewRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.reminderTableView = [[UITableView alloc] initWithFrame:viewRect style:UITableViewStylePlain];
    [self.reminderTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCellIdentifier"];
    self.reminderTableView.dataSource = self;
    self.reminderTableView.delegate = self;
    [self.view addSubview:self.reminderTableView];
    
    self.reminderButton = [[UIBarButtonItem alloc] initWithTitle:@"Add Reminder" style:UIBarButtonItemStylePlain target:self action:@selector(reminderButtonPressed)];
    [self.navigationItem setRightBarButtonItem: self.reminderButton];
    
    // 1. Set reminderTableView's data source, has to read from an array of reminders
    // 2. Add an object to the array of reminders
    // 3. Reload table after adding self.reminderTableView reload data
    self.reminderArray = [[NSMutableArray alloc] init];
    [self.reminderTableView reloadData];
    
    self.reminderTableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.reminderArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellIdentifier" forIndexPath:indexPath];
    NSLog(@"%@",indexPath);
    
    //controller
    
    //we have our model
    Reminder *reminderAtIndexPath = [self.reminderArray objectAtIndex:indexPath.row];
    
    // we are updating our view from our model
    cell.textLabel.text = reminderAtIndexPath.aString;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",reminderAtIndexPath.reminderDate];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    EditViewController *editVC = [[EditViewController alloc] init];
    [self.navigationController pushViewController:editVC animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    editVC.navigationItem.title = cell.textLabel.text;
    editVC.editString = cell.textLabel.text;
    NSLog(@"Cell Tapped");
}

- (void) reminderButtonPressed
{
    // set addreminderviewcontroller delegate to self
    AddReminderViewController *addReminderViewController = [[AddReminderViewController alloc] init];
    addReminderViewController.delegate = self;
    [self.navigationController pushViewController:addReminderViewController animated:YES];
}


- (void)addReminderViewController:(AddReminderViewController *)vc
                  createdReminder:(Reminder *)reminder
{
    //add to our array
    [self.reminderArray addObject:reminder];
    
    // update the table
    [self.reminderTableView reloadData];
    NSLog(@"Added %@ to array", reminder);
}



@end
