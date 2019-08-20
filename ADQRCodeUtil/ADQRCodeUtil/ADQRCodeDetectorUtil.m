//
//  ADQRCodeDetectorUtil.m
//  ADQRCodeUtil
//
//  Created by ade on 2019/8/20.
//  Copyright © 2019 cycf. All rights reserved.
//

#import "ADQRCodeDetectorUtil.h"

@implementation ADQRCodeDetectorUtil

+ (void)detectorWithImage:(UIImage *)image complete:(void(^ _Nullable )(NSString  * _Nullable codeString, NSString * _Nullable errorMsg))complete {
    NSString *resultStr;
    if (!image) {
        return;
    }
    // CIDetector(CIDetector可用于人脸识别)进行图片解析，从而使我们可以便捷的从相册中获取到二维码
    // 声明一个 CIDetector，并设定识别类型 CIDetectorTypeQRCode
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyHigh}];
    
    // 取得识别结果
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
    
    if (features.count == 0) {
        if (complete) {
            complete(nil, @"未发现二维码");
        }
    }else{
        for (int index = 0; index < [features count]; index ++) {
            CIQRCodeFeature *feature = [features objectAtIndex:index];
            resultStr = feature.messageString;
        }
        if (complete) {
            complete(resultStr, nil);
        }
    }
}

@end
