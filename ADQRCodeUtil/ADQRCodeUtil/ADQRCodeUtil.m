//
//  ADQRCodeUtil.m
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//

#import "ADQRCodeUtil.h"

@implementation ADQRCodeUtil

+ (void)detectorWithImage:(UIImage *)image complete:(void(^ _Nullable )(NSString  * _Nullable codeString, NSString * _Nullable errorMsg))complete {
    [ADQRCodeDetectorUtil detectorWithImage:image complete:complete];
}

+ (UIImage *)createQRCodeWithString:(NSString *)string size:(CGFloat)size {
    return [ADQRCodeCreateUtil createQRCodeWithString:string size:size];
}

+ (ADQRCodeView *)scanViewWithFrame:(CGRect)frame visibleRect:(CGRect)visibleRect complete:(void(^)(NSString *code))complete {
    return [ADQRCodeView scanViewWithFrame:frame visibleRect:visibleRect complete:complete];
}

+ (ADQRCodeView *)scanViewWithFrame:(CGRect)frame visibleRect:(CGRect)visibleRect delegate:(id<ADQRCodeViewDelegate>)delegate {
    ADQRCodeView *scanView = [ADQRCodeView scanViewWithFrame:frame visibleRect:visibleRect delegate:delegate];
    return scanView;
}

@end
