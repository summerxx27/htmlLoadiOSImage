//
//  MyCustomProtocol.h
//  h5如何访问iOS本地图片
//
//  Created by zjwang on 2017/7/6.
//  Copyright © 2017年 summerxx.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCustomURLProtocol : NSURLProtocol
{
    NSURLRequest *request;
}
+ (BOOL)canInitWithRequest:(NSURLRequest *)theRequest;
@end
