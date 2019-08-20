//
//  ADQRCodeDetectorUtil.h
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADQRCodeDetectorUtil : NSObject

+ (void)detectorWithImage:(UIImage *)image complete:(void(^ _Nullable )(NSString  * _Nullable codeString, NSString * _Nullable errorMsg))complete;
@end

NS_ASSUME_NONNULL_END
