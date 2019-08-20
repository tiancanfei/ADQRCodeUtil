//
//  ADCreateViewController.m
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//

#import "ADCreateViewController.h"
#import "ADQRCodeUtil.h"

@interface ADCreateViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ADCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.imageView.image) {
        [ADQRCodeUtil detectorWithImage:self.imageView.image complete:^(NSString * _Nullable codeString, NSString * _Nullable errorMsg) {
            if (errorMsg) {
                NSLog(@"%@", errorMsg);
            } else {
                NSLog(@"%@", codeString);
            }
        }];
        return;
    }
    UIImage *qrCodeImage = [ADQRCodeUtil createQRCodeWithString:@"测试" size:300];
    self.imageView.image = qrCodeImage;
}

@end
