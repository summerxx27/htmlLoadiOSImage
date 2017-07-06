//
//  MyCustomProtocol.m
//  h5如何访问iOS本地图片
//
//  Created by zjwang on 2017/7/6.
//  Copyright © 2017年 summerxx.com. All rights reserved.
//

#import "MyCustomProtocol.h"

@implementation MyCustomURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)theRequest
{
    if ([theRequest.URL.scheme caseInsensitiveCompare:@"myapp"] == NSOrderedSame) {
        return YES;
    }
    return NO;
}

+ (NSURLRequest*)canonicalRequestForRequest:(NSURLRequest *)theRequest
{
    return theRequest;
}

- (void)startLoading
{
    NSURLResponse *response = [[NSURLResponse alloc] initWithURL:[request URL]
                                                        MIMEType:@"image/png"
                                           expectedContentLength:-1
                                                textEncodingName:nil];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"image1" ofType:@"png"];
    NSData *data = [NSData dataWithContentsOfFile:imagePath];
    
    [[self client] URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [[self client] URLProtocol:self didLoadData:data];
    [[self client] URLProtocolDidFinishLoading:self];
    NSLog(@"start loading !");
    
}

- (void)stopLoading
{
    NSLog(@"something went wrong!");
}

@end



