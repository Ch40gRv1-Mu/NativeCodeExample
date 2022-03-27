//
//  MockResolver.m
//  NativeCodeProjectTests
//
//  Created by Kareem Shehata on 27/3/22.
//

#import "MockResolver.h"

#import <XCTest/XCTest.h>

@implementation MockResolver
- (instancetype)init {
  if (self = [super init]) {
    self->calls = [NSMutableArray arrayWithCapacity:1];
  }
  return self;
}

- (void)resolve:(id)result {
  [calls addObject:result];
}

- (void)assertNotCalled {
  XCTAssertEqual([calls count], 0);
}

- (void)assertResolvedWith:(id)result {
  XCTAssertEqual([calls count], 1);
  XCTAssertEqualObjects(calls[0], result);
}

- (RCTPromiseResolveBlock)resolveBlock {
  return ^(id result){[self resolve:result];};
}
@end
