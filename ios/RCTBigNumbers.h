//
//  RCTBigNumbers.h
//  
//
//  Created by Kareem Shehata on 18/3/22.
//

#ifndef RCTBigNumbers_h
#define RCTBigNumbers_h

#import <React/RCTBridgeModule.h>

@interface RCTBigNumbers : NSObject <RCTBridgeModule>
-(void)multiply:(nonnull NSNumber *)a
          withB:(nonnull NSNumber *)b
       resolver:(nonnull RCTPromiseResolveBlock)resolve
       rejecter:(nonnull RCTPromiseRejectBlock)reject;
@end

#endif /* RCTBigNumbers_h */
