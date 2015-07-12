//
//  SyncEngine.h
//  TestApp
//
//  Created by Dmitry Ivulyov on 12.07.15.
//  Copyright (c) 2015 Dmitry Ivulyov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyncEngine : NSObject

- (void)loadAllRemoteEmployeesWithCompletionBlock:(void (^)(NSArray *employees))block;

@end
