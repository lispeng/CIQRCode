//
//  ViewController.m
//  二维码处理
//
//  Created by mac on 15-11-30.
//  Copyright (c) 2015年 Lispeng. All rights reserved.
//

#import "ViewController.h"
#import "LSPQRCodeImage.h"
#import "LSPScanViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)generateQRCode;
- (IBAction)scanQRCode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generateQRCode {
    
    NSString *path = @"http://www.baidu.com";
    UIImage *image = [LSPQRCodeImage QRCodeImageWithURL:path];
    self.imageView.image = image;
}

- (IBAction)scanQRCode {
    
    LSPScanViewController *scan = [[LSPScanViewController alloc] init];
    
    [self presentViewController:scan animated:YES completion:nil];
}
@end
