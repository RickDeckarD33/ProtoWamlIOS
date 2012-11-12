#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate> {
    UIWebView* _webView;
    UILabel* _titleLabel;
    UILabel* _loadingLabel;
    UIActivityIndicatorView* _activityIndicator;
    UIImageView* _logoImage;
}

@property (nonatomic, retain) IBOutlet UIWebView* webview;
@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@property (nonatomic, retain) IBOutlet UILabel* loadingLabel;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView* activityIndicator;
@property (nonatomic, retain) IBOutlet UIImageView* logoImage;

@end
