//
//  EmployeesTableViewController.m
//  TestApp
//
//  Created by Dmitry Ivulyov on 12.07.15.
//  Copyright (c) 2015 Dmitry Ivulyov. All rights reserved.
//

#import "EmployeesTableViewController.h"

#import "Employee.h"
#import "SyncEngine.h"

@interface EmployeesTableViewController ()

@property (nonatomic, strong) NSArray *employees;
@property (nonatomic, strong) SyncEngine *syncEngine;

@end

@implementation EmployeesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.syncEngine = [[SyncEngine alloc] init];
    [self.syncEngine loadAllRemoteEmployeesWithCompletionBlock:^(NSArray *employees) {
        self.employees = employees;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.employees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const CellIdentifier = @"EmployeeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Employee *employee = self.employees[indexPath.row];
    cell.textLabel.text = employee.name;
    cell.detailTextLabel.text = employee.position;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
