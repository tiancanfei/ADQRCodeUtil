//
//  ADQRCodeUtil.h
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//  二维码工具（包括扫描和生成二维码）

#import <Foundation/Foundation.h>
#import "ADQRCodeView.h"
#import "ADQRCodeCreateUtil.h"

NS_ASSUME_NONNULL_BEGIN

@interface ADQRCodeUtil : NSObject

/// 生成二维码
+ (UIImage *)createQRCodeWithString:(NSString *)string size:(CGFloat)size;

/// 扫描二维码-block方式
+ (ADQRCodeView *)scanViewWithFrame:(CGRect)frame visibleRect:(CGRect)visibleRect complete:(void(^)(NSString *code))complete;

/// 扫描二维码-代理方式
+ (ADQRCodeView *)scanViewWithFrame:(CGRect)frame visibleRect:(CGRect)visibleRect delegate:(id<ADQRCodeViewDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
