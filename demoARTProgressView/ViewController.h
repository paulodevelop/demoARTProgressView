
#import <UIKit/UIKit.h>

@class ARTProgressView;

@interface ViewController : UIViewController <UIAccelerometerDelegate> {
    ARTProgressView *ascendingProgressView;
    ARTProgressView *descendingProgressView;
    ARTProgressView *randomProgressView;
    
    NSTimer *timerAsc, *timerDesc, *timerRandom;
}

@end
