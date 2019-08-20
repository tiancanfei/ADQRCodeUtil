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
    UIImage *qrCodeImage = [ADQRCodeUtil createQRCodeWithString:@"你好" size:300];
    self.imageView.image = qrCodeImage;
}

@end
