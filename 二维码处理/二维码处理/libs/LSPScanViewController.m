//
//  LSPScanViewController.m
//  二维码处理
//
//  Created by mac on 15-11-30.
//  Copyright (c) 2015年 Lispeng. All rights reserved.
//

#import "LSPScanViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface LSPScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (strong,nonatomic) AVCaptureSession *session;
@property (strong,nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@end

@implementation LSPScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //扫描二维码
    [self scanQRCode];
}

- (void)scanQRCode
{
    //1.调用摄像头
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //2.设置摄像头为输入设备
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    //3.创建元数据输出
    AVCaptureMetadataOutput *metadata = [[AVCaptureMetadataOutput alloc] init];
    //3.1设置元数据输出的代理
    [metadata setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //4.创建会话
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    //5.添加输入设备和元数据输出到会话
    [session addInput:deviceInput];
    [session addOutput:metadata];
    
    //6.设置元数据输出的类型
    [metadata setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    self.session = session;
    
    //7.创建视频预览图层
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    //7.1设置预览图层的Frame
    previewLayer.frame = self.view.bounds;
    
    //7.2将图层插入当前视图
    [self.view.layer insertSublayer:previewLayer atIndex:10];
    //8.开启会话
    [self.session startRunning];
}
//元数据输出的代理方法
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    //停止会话
    [self.session stopRunning];
    //移除当前视频图层
    [self.previewLayer removeFromSuperlayer];
    //获取二维码扫描到的数据
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *codeObject = metadataObjects[0];
        NSLog(@"codeObject = %@",codeObject.stringValue);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
