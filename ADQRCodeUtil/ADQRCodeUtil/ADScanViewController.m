//
//  ADScanViewController.m
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//  扫描二维码控制器，可以直接在xib作UI调整

#import "ADScanViewController.h"
#import "ADQRCodeUtil.h"

@interface ADScanViewController ()<ADQRCodeViewDelegate>

@property (nonatomic, strong) ADQRCodeView *scanView;

/// 扫描范围框
@property (weak, nonatomic) IBOutlet UIImageView *visibleImageView;

/// 背景（半透明）
@property (weak, nonatomic) IBOutlet UIView *coverView;

/// 背景的半透明度
@property (nonatomic, assign) IBInspectable CGFloat colorAlpha;

@end

@implementation ADScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.scanView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.scanView startScan];
}

#pragma mark 懒加载
- (ADQRCodeView *)scanView {
    if (!_scanView) {
        _scanView = [ADQRCodeUtil scanViewWithFrame:self.coverView.frame visibleRect:[self.visibleImageView convertRect:self.visibleImageView.bounds toView:self.coverView] delegate:self];
        self.coverView.backgroundColor = [self.coverView.backgroundColor colorWithAlphaComponent:self.colorAlpha];
        [_scanView setPreviewBackgroundWithBackgroundView:self.coverView];
    }
    return _scanView;
}

#pragma mark ADQRCodeViewDelegate

- (void)scanView:(ADQRCodeView *)scanView didFinishedScanWithCodeString:(NSString *)codeString {
    NSLog(@"%@", codeString);
}

@end
