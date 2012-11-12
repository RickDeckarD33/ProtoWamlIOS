#import "ViewController.h"

#define WAML_URL @"http://ocp1.rd.francetelecom.com/httppvc_clnss80.12.202.196/myshop-sosh/p/DevicesList"

@interface ViewController () {
    BOOL _start;
    NSDate* _startDate;
}

@end

@implementation ViewController

@synthesize webview = _webView;
@synthesize titleLabel = _titleLabel;
@synthesize loadingLabel = _loadingLabel;
@synthesize activityIndicator = _activityIndicator;
@synthesize logoImage = _logoImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _start = TRUE;
    [self.webview setDelegate:self];
    NSURL* url = [[NSURL alloc] initWithString:WAML_URL];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    [self.webview loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [self.activityIndicator startAnimating];
    [self.activityIndicator setHidden:FALSE];

    _startDate = [NSDate date];
    
    if (_start) {
        _startDate = [NSDate date];
        [self.loadingLabel setText:[NSString stringWithFormat:@"chargement en cours...\nurl : %@", WAML_URL]];
        [self.loadingLabel setHidden:FALSE];
        UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressInLoading)];
        [self.loadingLabel addGestureRecognizer:longPress];
        [self.loadingLabel setUserInteractionEnabled:TRUE];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden:TRUE];

    NSTimeInterval timeInterval = [_startDate timeIntervalSinceNow];

    
    if (_start) {

        NSLog(@"initialize loading duration : %f", -timeInterval);
        
        [self.loadingLabel setHidden:TRUE];
        [self.loadingLabel setUserInteractionEnabled:FALSE];
        
        [self.titleLabel setHidden:TRUE];
        
        [self.webview setHidden:FALSE];
        
        [self.logoImage setHidden:TRUE];
        
        _start = FALSE;
        
    } else {
        NSLog(@"other loading duration : %f", -timeInterval);
    }
}

- (void) longPressInLoading {
    [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString:WAML_URL]];
}

@end
