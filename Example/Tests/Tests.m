//
//  JVNLoggerTests.m
//  JVNLoggerTests
//
//  Created by Javen Wang on 04/17/2016.
//  Copyright (c) 2016 Javen Wang. All rights reserved.
//

#import <JVNLogger/JVNLogger.h>
@import XCTest;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLog
{
    JVNLogError(@"error");
    JVNLogWarn(@"warn");
    JVNLogInfo(@"hello info %@", NSStringFromClass([JVNLogger class]));
    JVNLogDebug(@"debug");
}

@end

