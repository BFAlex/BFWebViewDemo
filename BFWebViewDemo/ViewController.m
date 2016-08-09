//
//  ViewController.m
//  BFWebViewDemo
//
//  Created by Readboy_BFAlex on 16/8/8.
//  Copyright © 2016年 BF. All rights reserved.
//

#import "ViewController.h"
#import "BFWebView.h"

@interface ViewController () <UIWebViewDelegate> {
    BFWebView *webView;
}
@property (weak, nonatomic) IBOutlet UIView *webViewContainer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [self initWebView];
}

#pragma mark - customized

- (void)initWebView {
    NSLog(@"%s", __func__);
    
    if (webView) { return; }
    
    CGRect frame = self.webViewContainer.bounds;
    frame.size.width -= 10;
    frame.origin.x += 5;
    frame.size.height -= 10;
    frame.origin.y += 5;
    
    webView = [[BFWebView alloc] initWithFrame:frame];
    
    [self.webViewContainer addSubview:webView];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
    webView.delegate = self;
    
    webView.scalesPageToFit = YES;
}

#pragma mark - other

- (IBAction)clickBackBtn:(UIButton *)sender {
    if (webView.canGoBack) {
        [webView goBack];
    }
}

- (IBAction)clickForward:(UIButton *)sender {
    if (webView.canGoForward) {
        [webView goForward];
    }
}

- (IBAction)clickReloadDataBtn:(UIButton *)sender {
    [webView reload];
}

@end
