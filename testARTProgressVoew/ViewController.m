
#import "ViewController.h"
#import "ARTProgressView.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float timeInterval = 0.05;
    /*
    ascendingProgressView = [[ARTProgressView alloc]initWithFrame:CGRectMake(10, 50, [[UIScreen mainScreen] bounds].size.width-20, 0)];
    ascendingProgressView.progress = 0.0;
    ascendingProgressView.font = [UIFont fontWithName:@"Helvetica" size:ARTSmallSizeFont];
    ascendingProgressView.title = @"Ascending";
    ascendingProgressView.valueTag = @"goods";
    ascendingProgressView.maxValue = [NSNumber numberWithFloat:10];
    ascendingProgressView.progressTintColor = [UIColor colorWithHue:0.36 saturation:0.88 brightness:0.88 alpha:1.0];
    [self.view addSubview:ascendingProgressView];

    descendingProgressView = [[ARTProgressView alloc]initWithFrame:CGRectMake(10, 150, [[UIScreen mainScreen] bounds].size.width-20, 0)];
    descendingProgressView.progress = 1.0;
    descendingProgressView.font = [UIFont fontWithName:@"Helvetica" size:ARTLargeSizeFont];
    descendingProgressView.title = @"Descending";
    descendingProgressView.valueTag = @"things";
    descendingProgressView.maxValue = [NSNumber numberWithFloat:20];
    descendingProgressView.progressTintColor = [UIColor colorWithHue:0.86 saturation:0.88 brightness:0.88 alpha:1.0];
    [self.view addSubview:descendingProgressView];*/

    randomProgressView = [[ARTProgressView alloc]initWithFrame:CGRectMake(10, [[UIScreen mainScreen] bounds].size.height/2, [[UIScreen mainScreen] bounds].size.width-20, 0)];
    randomProgressView.progress = 0.8;
    randomProgressView.font = [UIFont fontWithName:@"Helvetica" size:13.0];
    randomProgressView.title = @"Random";
    //randomProgressView.valueTag = @"stuff";
    randomProgressView.maxValue = [NSNumber numberWithFloat:100];
    randomProgressView.progressTintColor = [UIColor colorWithHue:1.00 saturation:0.88 brightness:0.88 alpha:1.0];
    [self.view addSubview:randomProgressView];

    
    [self performSelectorOnMainThread:@selector(makeAscendingProgressViewMoving) withObject:nil waitUntilDone:NO];
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(makeAscendingProgressViewMoving) userInfo:nil repeats:YES];
    
    [self performSelectorOnMainThread:@selector(makeDescendingProgressViewMoving) withObject:nil waitUntilDone:NO];
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(makeDescendingProgressViewMoving) userInfo:nil repeats:YES];
    
    [self performSelectorOnMainThread:@selector(makeRandomProgressViewMoving) withObject:nil waitUntilDone:NO];
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(makeRandomProgressViewMoving) userInfo:nil repeats:YES];


}

- (void)makeAscendingProgressViewMoving
{
    float actual = ascendingProgressView.progress;
    
    if (actual < 1.0) {
        actual += 0.01;
        [ascendingProgressView setProgress:actual animated:YES];
    }
}

- (void)makeDescendingProgressViewMoving
{
    float actual = descendingProgressView.progress;
    
    if (actual > 0.0) {
        actual -= 0.01;
        [descendingProgressView setProgress:actual animated:YES];
    }
}


- (void)makeRandomProgressViewMoving
{
    float actual = randomProgressView.progress;
    
    /*
    // A simple simulation of a driver behavior
    
    NSNumber *maxAcceleration = [NSNumber numberWithFloat:1.0 * 100];
    
    NSNumber *acceleration = [NSNumber numberWithInt:arc4random() % [maxAcceleration intValue]];
    NSInteger accDec = [acceleration intValue];
    
    acceleration = [NSNumber numberWithFloat:accDec/100.0];
    actual = [acceleration floatValue];
    */
    
    static int index = 0;
    
    NSArray *rocking = [[NSArray alloc]initWithObjects:@"0.50", @"0.53", @"0.54", @"0.55", @"0.56", @"0.55", @"0.54", @"0.53", @"0.52", @"0.51", @"0.50", @"0.49", @"0.48", @"0.47", @"0.46", @"0.45", @"0.44", @"0.43", @"0.42", @"0.35", @"0.34", @"0.36", @"0.38", @"0.30", @"0.28", @"0.26", @"0.24", @"0.22", @"0.24", @"0.26", @"0.28", @"0.30", @"0.32", @"0.34", @"0.36", @"0.38", @"0.40", @"0.42", @"0.44", @"0.46", @"0.48", @"0.50", @"0.51", @"0.52", @"0.53", @"0.54", @"0.55", @"0.56", @"0.57", @"0.58", @"0.59", @"0.60", @"0.61", @"0.62", @"0.63", nil];
    
    // NSLog(@"actual=%f", actual);
    
    actual = [[rocking objectAtIndex:index] floatValue];
    
    if (index < [rocking count]-1)
        index++;
    else
        index = 0;
    
    [randomProgressView setProgress:actual animated:NO];
    
}

- (IBAction)reset:(id)sender
{
    [randomProgressView reset];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
