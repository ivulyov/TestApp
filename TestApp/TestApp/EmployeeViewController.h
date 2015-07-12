//
//  EmployeeViewController.h
//  TestApp
//
//  Created by Dmitry Ivulyov on 12.07.15.
//  Copyright (c) 2015 Dmitry Ivulyov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Employee;

@interface EmployeeViewController : UIViewController

@property (nonatomic, strong) Employee *employee;

@end
