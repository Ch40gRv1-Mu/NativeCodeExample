//
//  MockResolverTest.m
//  BigNumbersTest
//
//  Created by Kareem Shehata on 27/3/22.
//

#import "MockResolver.h"

#import <XCTest/XCTest.h>
#import <React/RCTBridgeModule.h>

@interface MockResolverTest : XCTestCase
@end

@implementation MockResolverTest {
  MockResolver* resolver;
}


+ (void)doResolve:(id)result resolver:(RCTPromiseResolveBlock)resolve{
  resolve(result);
}

- (void)setUp {
  self->resolver = [[MockResolver alloc] init];
}

- (void)tearDown {
}

- (void)testCreateResolver {
  XCTAssertNotNil(resolver);
  XCTAssertNotNil(resolver->calls);
  XCTAssertEqual([resolver->calls count], 0);
  [resolver assertNotCalled];
}

- (void)testCallResolverOnce {
  NSString *str = @"Hello World";
  [resolver resolve:str];
  [resolver assertResolvedWith:str];
}

- (void)testCallResolverManyTimes {
  NSString *str = @"Hello World";
  NSNumber *i = @42;
  [resolver resolve:str];
  [resolver resolve:i];
  [resolver resolve:i];
  [resolver resolve:str];
  XCTAssertEqual([resolver->calls count], 4);
  XCTAssertEqualObjects(resolver->calls[0], str);
  XCTAssertEqualObjects(resolver->calls[1], i);
  XCTAssertEqualObjects(resolver->calls[2], i);
  XCTAssertEqualObjects(resolver->calls[3], str);
}

- (void)testDoResolve {
  NSString *str = @"Hello World";
  [MockResolverTest doResolve:str resolver:[resolver resolveBlock]];
  [resolver assertResolvedWith:str];
}

@end
