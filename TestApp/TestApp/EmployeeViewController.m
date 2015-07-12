//
//  EmployeeViewController.m
//  TestApp
//
//  Created by Dmitry Ivulyov on 12.07.15.
//  Copyright (c) 2015 Dmitry Ivulyov. All rights reserved.
//

#import "EmployeeViewController.h"

#import "Employee.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface EmployeeViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)setupViews {
    self.title = self.employee.name;
    [self.imageView sd_setImageWithURL:self.employee.largePicURL
                      placeholderImage:nil];
}

@end
