//
//  DetailViewController.h
//  NavigationComb
//
//  Created by 黄生辉 on 15/9/7.
//  Copyright (c) 2015年 yy Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) NSString *url;

@end
