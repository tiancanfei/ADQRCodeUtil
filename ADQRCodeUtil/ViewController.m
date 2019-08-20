//
//  ViewController.m
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//

#import "ViewController.h"
#import "ADScanViewController.h"
#import "ADCreateViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)jump2Scan {
    ADScanViewController *scanViewVC = [[ADScanViewController alloc] init];
    [self.navigationController pushViewController:scanViewVC animated:YES];
}

- (IBAction)jump2Create {
    ADCreateViewController *scanViewVC = [[ADCreateViewController alloc] init];
    [self.navigationController pushViewController:scanViewVC animated:YES];
}

@end
