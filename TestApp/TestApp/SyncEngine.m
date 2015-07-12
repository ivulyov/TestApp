//
//  SyncEngine.m
//  TestApp
//
//  Created by Dmitry Ivulyov on 12.07.15.
//  Copyright (c) 2015 Dmitry Ivulyov. All rights reserved.
//

#import "SyncEngine.h"

#import "RestKit/RestKit.h"

#import "Employee.h"

@implementation SyncEngine

static NSString *EmployeesURL = @"https://s3-us-west-2.amazonaws.com/wirestorm/assets/response.json";

- (void)loadAllRemoteEmployeesWithCompletionBlock:(void (^)(NSArray *))block {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Employee class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"name":       @"name",
                                                  @"position":   @"position",
                                                  @"smallpic":   @"smallPicURL",
                                                  @"lrgpic":     @"largePicURL"
                                                  }];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:nil];
    NSURL *url = [NSURL URLWithString:EmployeesURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        block([result array]);
    } failure:nil];
    [operation start];
}

@end
