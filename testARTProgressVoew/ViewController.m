
#import "ViewController.h"
#import "ARTProgressView.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ascendingProgressView = [[ARTProgressView alloc]initWithFrame:CGRectMake(10.0f, 50.0f, [[UIScreen mainScreen] bounds].size.width-20.0f, 0.0f)];
    ascendingProgressView.progress = 0.0f;
    ascendingProgressView.font = [UIFont fontWithName:@"Helvetica" size:ARTMediumSizeFont];
    ascendingProgressView.title = @"Ascending";
    ascendingProgressView.valueTag = @"goods";
    ascendingProgressView.maxValue = [NSNumber numberWithFloat:15.0f];
    ascendingProgressView.progressTintColor = [UIColor colorWithHue:0.36f saturation:0.88f brightness:0.88f alpha:1.0f];
    [self.view addSubview:ascendingProgressView];
    
    descendingProgressView = [[ARTProgressView alloc]initWithFrame:CGRectMake(10.0f, 140.0f, [[UIScreen mainScreen] bounds].size.width-20.0f, 0.0f)];
    descendingProgressView.progress = 1.0f;
    descendingProgressView.font = [UIFont fontWithName:@"Gill Sans" size:ARTLargeSizeFont];
    descendingProgressView.title = @"Descending";
    descendingProgressView.valueTag = @"things";
    descendingProgressView.maxValue = [NSNumber numberWithFloat:150.0f];
    descendingProgressView.progressTintColor = [UIColor colorWithHue:0.16f saturation:0.88f brightness:0.88f alpha:1.0f];
    [self.view addSubview:descendingProgressView];
    
    randomProgressView = [[ARTProgressView alloc]initWithFrame:CGRectMake(10.0f, [[UIScreen mainScreen] bounds].size.height/2, [[UIScreen mainScreen] bounds].size.width-20.0f, 0.0f)];
    randomProgressView.progress = 0.8f;
    randomProgressView.font = [UIFont fontWithName:@"Times New Roman" size:ARTMediumSizeFont];
    randomProgressView.title = @"Random";
    randomProgressView.valueTag = @"stuff";
    randomProgressView.maxValue = [NSNumber numberWithFloat:1500.0f];
    randomProgressView.progressTintColor = [UIColor colorWithHue:1.0f saturation:0.88f brightness:0.88f alpha:1.0f];
    [self.view addSubview:randomProgressView];
    
    [self startProgressViews];
}

- (void)startProgressViews
{
    NSTimeInterval timeInterval = 0.05;
    
    [self performSelectorOnMainThread:@selector(movingAscendingProgressView) withObject:nil waitUntilDone:YES];
    timerAsc = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(movingAscendingProgressView) userInfo:nil repeats:YES];
    
    [self performSelectorOnMainThread:@selector(movingDescendingProgressView) withObject:nil waitUntilDone:YES];
    timerDesc = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(movingDescendingProgressView) userInfo:nil repeats:YES];
    
    [self performSelectorOnMainThread:@selector(movingRandomProgressView) withObject:nil waitUntilDone:YES];
    timerRandom = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(movingRandomProgressView) userInfo:nil repeats:YES];
    
}

- (void)movingAscendingProgressView
{
    CGFloat actual = ascendingProgressView.progress;
    
    actual += 0.01f;
    
    if (actual < 1.0f)
        [ascendingProgressView setProgress:actual animated:NO];
}

- (void)movingDescendingProgressView
{
    CGFloat actual = descendingProgressView.progress;
    
    actual -= 0.01f;
    
    if (actual > 0.0f)
        [descendingProgressView setProgress:actual animated:NO];
}


- (void)movingRandomProgressView
{
    CGFloat actual = randomProgressView.progress;

    // Increase or decrease progress
    NSInteger increaseDecrease = arc4random() % 2;
    if (!increaseDecrease)
        increaseDecrease = -1;
    
    // Offset progress
    NSInteger offset = arc4random() % 5;
    CGFloat floatOffset = offset/100.0f;
    
    actual = actual + floatOffset * increaseDecrease;
    
    if (actual >= 0.0f && actual <= 1.0f)
        [randomProgressView setProgress:actual animated:NO];
    
}

- (IBAction)restart:(id)sender
{
    ascendingProgressView.progress = 0.0f;
    ascendingProgressView.maxValue = [NSNumber numberWithFloat:15.0f];
    [ascendingProgressView reset];
    [timerAsc invalidate];
    timerAsc = nil;
    
    descendingProgressView.progress = 1.0f;
    descendingProgressView.maxValue = [NSNumber numberWithFloat:150.0f];
    [descendingProgressView reset];
    [timerDesc invalidate];
    timerDesc = nil;

    randomProgressView.progress = 0.8f;
    randomProgressView.maxValue = [NSNumber numberWithFloat:1500.0f];
    [randomProgressView reset];
    [timerRandom invalidate];
    timerRandom = nil;

    [self startProgressViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
