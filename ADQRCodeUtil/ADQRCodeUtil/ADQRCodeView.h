//
//  ADQRCodeView.h
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ADQRCodeView;

@protocol ADQRCodeViewDelegate <NSObject>

/// 识别成功代理回调
- (void)scanView:(ADQRCodeView *)scanView didFinishedScanWithCodeString:(NSString *)codeString;

@end

@interface ADQRCodeView : UIView

@property (nonatomic, weak) id<ADQRCodeViewDelegate> delegate;

/// 可扫描区域
@property (nonatomic, assign)  CGRect visibleRect;

/// 识别成功block回调
@property (nonatomic, copy, nullable) void(^complete)(NSString *code);

/// 设置背景（半透明那个背景）
- (void)setPreviewBackgroundWithBackgroundView:(UIView *)backgroundView;

/// 开始扫描
- (void)startScan;

/// 关闭扫描
- (void)stopScan;

+ (instancetype)scanViewWithFrame:(CGRect)frame visibleRect:(CGRect)visibleRect delegate:(id<ADQRCodeViewDelegate>)delegate;

+ (instancetype)scanViewWithFrame:(CGRect)frame visibleRect:(CGRect)visibleRect complete:(void(^)(NSString *code))complete;


@end

NS_ASSUME_NONNULL_END
