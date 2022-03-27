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
  MockResolver *resolver;
  MockReject *reject;
}

@end

@implementation RCTBigNumbersTest

- (void)setUp {
  resolver = [[MockResolver alloc] init];
  reject = [[MockReject alloc] init];
}

- (void)tearDown {
}

- (void)testMultiply {
  RCTBigNumbers *t = [[RCTBigNumbers alloc] init];
  [t multiply:@6 withB:@7 resolver:[resolver resolveBlock] rejecter:[reject rejectBlock]];
  [resolver assertResolvedWith:@42];
  [reject assertNotCalled];
}
@end
