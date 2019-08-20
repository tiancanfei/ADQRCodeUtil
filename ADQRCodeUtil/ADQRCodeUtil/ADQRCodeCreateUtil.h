//
//  ADQRCodeCreateUtil.h
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADQRCodeCreateUtil : NSObject

/// 将字符串生成二维码
+ (UIImage *)createQRCodeWithString:(NSString *)string size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
