//
//  MockRejectTest.m
//  NativeCodeProjectTests
//
//  Created by Kareem Shehata on 27/3/22.
//

#import "MockReject.h"

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@interface MockRejectTest : XCTestCase

@end

@implementation MockRejectTest {
  MockReject* reject;
}

+ (void)doReject:(NSString *)code
      withMessage:(NSString *)message
        withError:(NSError *)error
         rejector:(RCTPromiseRejectBlock)reject {
  reject(code, message, error);
}

- (void)setUp {
  self->reject = [[MockReject alloc] init];
}

- (void)tearDown {
}

- (void)testCreateReject {
  XCTAssertNotNil(reject);
  XCTAssertNotNil(reject->calls);
  XCTAssertEqual([reject->calls count], 0);
  [reject assertNotCalled];
}

- (void)testRejectOnce {
  NSString *code = @"EpicMegaFail";
  NSString *message = @"D00d yer code sucks";
  NSError *error = nil; //[NSError errorWithDomain:@"sg.edu.nus" code:200];
  [reject reject:code withMessage:message withError:error];
  [reject assertRejectedWith:code withMessage:message withError:error];
}

- (void)testRejectNoCode {
  NSString *message = @"D00d yer code sucks";
  [reject reject:nil withMessage:message withError:nil];
  [reject assertRejectedWith:nil withMessage:message withError:nil];
}

- (void)testRejectNoMessage {
  [reject reject:nil withMessage:nil withError:nil];
  [reject assertRejectedWith:nil withMessage:nil withError:nil];
}

- (void)testDoReject {
  NSString *code = @"EpicMegaFail";
  NSString *message = @"D00d yer code sucks";
  NSError *error = nil; //[NSError errorWithDomain:@"sg.edu.nus" code:200];
  [MockRejectTest doReject:code withMessage:message withError:error rejector:[reject rejectBlock]];
  [reject assertRejectedWith:code withMessage:message withError:error];
}

@end
