//
//  LSPQRCodeImage.m
//  二维码处理
//
//  Created by mac on 15-11-30.
//  Copyright (c) 2015年 Lispeng. All rights reserved.
//

#import "LSPQRCodeImage.h"

@implementation LSPQRCodeImage
+ (UIImage *)QRCodeImageWithURL:(NSString *)url
{
    
    //1.实例化二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //2.把二维码设置回默认的形式
    [filter setDefaults];
    //3.获取生成二维码要转换的信息
    NSData *data = [url dataUsingEncoding:NSUTF8StringEncoding];
    //4.利用KVC把二维码的信息设置进二维码的输出格式
    [filter setValue:data forKey:@"inputMessage"];
    //5.生成二维码图片CIImagege格式的
    CIImage *iImage = [filter outputImage];
    //5.图片格式转换
    UIImage *image = [UIImage imageWithCIImage:iImage];
    //6.返回二维码图片
    return image;
}

@end
