//
//  RCTBigNumbers.m
//  
//
//  Created by Kareem Shehata on 18/3/22.
//

#import "RCTBigNumbers.h"

#import <React/RCTLog.h>

@implementation RCTBigNumbers

RCT_EXPORT_METHOD(multiply:(nonnull NSNumber *)a
                  withB:(nonnull NSNumber *)b
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  RCTLogInfo(@"Hello World!");
  RCTLogInfo(@"Multiply %@ and %@", a, b);
  resolve(@([a longValue] * [b longValue]));
//  reject(@"epic_fail", @"dude", nil);
}

// To export a module named BigNumbers
RCT_EXPORT_MODULE();

@end
