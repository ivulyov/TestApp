//
//  Employee.h
//  TestApp
//
//  Created by Dmitry Ivulyov on 12.07.15.
//  Copyright (c) 2015 Dmitry Ivulyov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, strong) NSURL *smallPicURL;
@property (nonatomic, strong) NSURL *largePicURL;

@end
