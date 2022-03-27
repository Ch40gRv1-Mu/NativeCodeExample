//
//  MockResolver.h
//  NativeCodeProject
//
//  Created by Kareem Shehata on 27/3/22.
//

#ifndef MockResolver_h
#define MockResolver_h

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface MockResolver : NSObject {
  @public
  NSMutableArray *calls;
}
- (void)resolve:(id)result;
- (void)assertNotCalled;
- (void)assertResolvedWith:(id)result;
- (RCTPromiseResolveBlock)resolveBlock;
@end

#endif /* MockResolver_h */
