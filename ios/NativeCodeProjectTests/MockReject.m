//
//  MockReject.m
//  NativeCodeProjectTests
//
//  Created by Kareem Shehata on 27/3/22.
//

#import "MockReject.h"

#import <XCTest/XCTest.h>

id valueOrNull(id v) {
  return v ? v : [NSNull null];
}

@implementation MockReject
- (instancetype)init {
  if (self = [super init]) {
    self->calls = [NSMutableArray arrayWithCapacity:1];
  }
  return self;
}

- (void)reject:(NSString *)code
   withMessage:(NSString *)message
     withError:(NSError *)error {
  [calls addObject:@[valueOrNull(code), valueOrNull(message), valueOrNull(error)]];
}

- (void)assertNotCalled {
  XCTAssertEqual([calls count], 0);
}

- (void)assertRejectedWith:(NSString *)code
               withMessage:(NSString *)message
                 withError:(NSError *)error {
  XCTAssertEqual([calls count], 1);
  NSArray *exp = @[valueOrNull(code), valueOrNull(message), valueOrNull(error)];
  XCTAssertEqualObjects(calls[0], exp);
}

- (RCTPromiseRejectBlock)rejectBlock {
  return ^(NSString *code, NSString *message, NSError *error) {
    [self reject:code withMessage:message withError:error];
  };
  return nil;
}
@end
