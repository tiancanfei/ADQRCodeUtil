//
//  ADQRCodeView.m
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//  二维码扫描工具

#import "ADQRCodeView.h"
#import <AVFoundation/AVFoundation.h>

#define kADQRCodeViewScreenW [UIScreen mainScreen].bounds.size.width
#define kADQRCodeViewScreenH [UIScreen mainScreen].bounds.size.height

@interface ADQRCodeView()<AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) AVCaptureDevice * device;
@property (strong, nonatomic) AVCaptureDeviceInput * input;
@property (strong, nonatomic) AVCaptureMetadataOutput * output;
@property (strong, nonatomic) AVCaptureSession * session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer * preview;

@end

@implementation ADQRCodeView


+ (instancetype)scanViewWithFrame:(CGRect)frame visibleRect:(CGRect)visibleRect delegate:(id<ADQRCodeViewDelegate>)delegate
{
    ADQRCodeView *scanView = [[self alloc] initWithFrame:frame];
    scanView.visibleRect = visibleRect;
    scanView.delegate = delegate;
    return scanView;
}

+ (instancetype)scanViewWithFrame:(CGRect)frame visibleRect:(CGRect)visibleRect complete:(void(^)(NSString *code))complete {
    ADQRCodeView *scanView = [[self alloc] initWithFrame:frame];
    scanView.complete = complete;
    return scanView;
}

- (void)setupCamera
{
    // Device
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    self.output = [[AVCaptureMetadataOutput alloc]init];
    
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    self.session = [[AVCaptureSession alloc]init];
    if ([self.session canAddInput:self.input])
    {
        [self.session addInput:self.input];
    }
    
    if ([self.session canAddOutput:self.output])
    {
        [self.session addOutput:self.output];
    }
    
    // 条码类型(删除二维码识别AVMetadataObjectTypeQRCode)
    self.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
    
    // Preview
    self.preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.preview.frame = self.bounds;
    [self.layer insertSublayer:self.preview atIndex:0];
}

#pragma mark 设置可扫描范围
- (void)setVisibleRect:(CGRect)visibleRect
{
    _visibleRect = visibleRect;
    if (CGRectEqualToRect(visibleRect, CGRectZero))
    {
        _visibleRect = self.bounds;
    }
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        [self stopScan];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [self performSelector:@selector(dismissWithString:) withObject:stringValue afterDelay:0.3];
}

- (void)dismissWithString:(NSString *)stringValue
{
    if ([self.delegate respondsToSelector:@selector(scanView:didFinishedScanWithCodeString:)]) {
        [self.delegate scanView:self didFinishedScanWithCodeString:stringValue];
    }
}

#pragma mark 开始扫描
- (void)startScan
{
    if (!self.device) {
        [self setupCamera];
    }
    
    [self.session startRunning];
    
    CGRect rectOfInterest = [self.preview metadataOutputRectOfInterestForRect:self.visibleRect];
    
    [self.output setRectOfInterest:rectOfInterest];
}

#pragma mark 停止扫描
- (void)stopScan{
    [self.session stopRunning];
}

#pragma mark 设置背景（那个半透明背景）
- (void)setPreviewBackgroundWithBackgroundView:(UIView *)backgroundView{
    [self.layer addSublayer:backgroundView.layer];
    
    UIBezierPath *outerBorderPath = [UIBezierPath bezierPathWithRect:backgroundView.frame];
    
    UIBezierPath *innderBorderPath = [UIBezierPath bezierPathWithRect:self.visibleRect];
    
    [outerBorderPath appendPath:innderBorderPath];
    
    CAShapeLayer *visibleRectLayer = [CAShapeLayer layer];
    
    visibleRectLayer.path = outerBorderPath.CGPath;
    
    visibleRectLayer.fillRule = kCAFillRuleEvenOdd;
    
    backgroundView.layer.mask = visibleRectLayer;
}

#pragma mark 对象销毁前关闭扫描
- (void)dealloc {
    [self stopScan];
}

@end
