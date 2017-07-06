//
//  ViewController.m
//  h5如何访问iOS本地图片
//
//  Created by zjwang on 2017/7/6.
//  Copyright © 2017年 summerxx.com. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomProtocol.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    [self.view addSubview:self.webView];
    [NSURLProtocol registerClass:[MyCustomURLProtocol class]];
    NSString *localHtmlFilePath = [[NSBundle mainBundle] pathForResource:@"file" ofType:@"html"];
    NSString *localHtmlFileURL = [NSString stringWithFormat:@"file://%@", localHtmlFilePath];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:localHtmlFileURL]]];
    NSString *html = [NSString stringWithContentsOfFile:localHtmlFilePath encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:html baseURL:nil];
}

@end
