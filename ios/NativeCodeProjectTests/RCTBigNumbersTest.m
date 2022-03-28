//
//  RCTBigNumbersTest.m
//  NativeCodeProjectTests
//
//  Created by Kareem Shehata on 27/3/22.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>

#import "MockResolver.h"
#import "MockReject.h"
#import "RCTBigNumbers.h"

@interface NSObject (Private)
- (NSString*)_methodDescription;
@end

@interface RCTBigNumbersTest : XCTestCase {
  RCTBigNumbers *t;
  MockResolver *resolver;
  MockReject *reject;
}

@end

@implementation RCTBigNumbersTest

- (void)setUp {
  t = [[RCTBigNumbers alloc] init];
  resolver = [[MockResolver alloc] init];
  reject = [[MockReject alloc] init];
}

- (void)tearDown {
}

- (void)testMultiply {
  [t multiply:@6 withB:@7 resolver:[resolver resolveBlock] rejecter:[reject rejectBlock]];
  [resolver assertResolvedWith:@42];
  [reject assertNotCalled];
}

- (void)testSumIntegers {
  [t sum:@[@2, @4, @38] resolver:[resolver resolveBlock] rejecter:[reject rejectBlock]];
  [resolver assertResolvedWith:@44];
  [reject assertNotCalled];
}

- (void)testSumMixed {
  [t sum:@[@2.3, @4.7, @38] resolver:[resolver resolveBlock] rejecter:[reject rejectBlock]];
  // sum only does the integer sum. Not really meant for floats.
  [resolver assertResolvedWith:@44];
  [reject assertNotCalled];
}

- (void)testSumStrings {
  [t sum:@[@2, @"4", @38] resolver:[resolver resolveBlock] rejecter:[reject rejectBlock]];
  [resolver assertResolvedWith:@44];
  [reject assertNotCalled];
}

- (void)testSumReject {
  [t sum:@[@2, @{}, @38] resolver:[resolver resolveBlock] rejecter:[reject rejectBlock]];
  [resolver assertNotCalled];
  [reject assertRejectedWith:@"mega_fail" withMessage:@"Unknown object type" withError:nil];
}

- (void)testConcat {
  [t concat:@[@"abcdefg", @"hijklmnop", @"qrstuvwxyz"] resolver:[resolver resolveBlock] rejecter:[reject rejectBlock]];
  [resolver assertResolvedWith:@"abcdefg; hijklmnop; qrstuvwxyz; "];
  [reject assertNotCalled];
}

- (void)testMakeAnArray {
  [t makeAnArray:[resolver resolveBlock] rejecter:[reject rejectBlock]];
  [resolver assertResolvedWith:@[@"abcdefg", @"hijklmnop"]];
  [reject assertNotCalled];
}
@end
