//
//  LSPQRCodeImage.h
//  二维码处理
//
//  Created by mac on 15-11-30.
//  Copyright (c) 2015年 Lispeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSPQRCodeImage : UIImage
/**
 * 传入一个你想要的二维码的信息,会自动生成二维码图片
 */
+ (UIImage *)QRCodeImageWithURL:(NSString *)url;

@end
