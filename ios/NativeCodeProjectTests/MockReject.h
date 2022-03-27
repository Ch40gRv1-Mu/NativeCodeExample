//
//  MockReject.h
//  Pods
//
//  Created by Kareem Shehata on 27/3/22.
//

#ifndef MockReject_h
#define MockReject_h

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface MockReject : NSObject {
  @public
  NSMutableArray *calls;
}
- (void)reject:(NSString *)code
   withMessage:(NSString *)message
     withError:(NSError *)error;

- (void)assertNotCalled;

- (void)assertRejectedWith:(NSString *)code
               withMessage:(NSString *)message
                 withError:(NSError *)error;

- (RCTPromiseRejectBlock)rejectBlock;
@end

#endif /* MockReject_h */
