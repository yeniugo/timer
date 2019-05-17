//
//  ViewController.m
//  timer
//
//  Created by 胡凯 on 2019/5/17.
//  Copyright © 2019 胡凯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) CADisplayLink *disLink;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.disLink==nil) {
        CADisplayLink *disLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(runDisLink)];
        [disLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        self.disLink = disLink;
    }
}

- (void)runDisLink{
    CGFloat time = [self getPersent];
    NSLog(@"%f,%d",time,29-(int)(time*30));
//    NSDate *date = [NSDate date];
//    double time1 = [date timeIntervalSince1970];
//    double time2 = [[NSUserDefaults standardUserDefaults] doubleForKey:@"time"];
//    NSLog(@"%ld,%ld",(long)time1/30,(long)time2);
//    if ((long)time1/30!=time2) {
//        NSLog(@"change------------");
//    }
}

- (CGFloat)getPersent{
    NSDate *date = [NSDate date];
    double time = [date timeIntervalSince1970];
    long time1 = (long)time/30;
    double time2 = [[NSUserDefaults standardUserDefaults] doubleForKey:@"time4"];
    if ((long)time2==0) {
        time2 = (double)time1;
    }
    if ((long)time2!=time1) {
        NSLog(@"change------------");
    }
    [[NSUserDefaults standardUserDefaults] setDouble:(double)(time1) forKey:@"time4"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return (NSInteger)(time*100)%3000/3000.0;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.disLink invalidate];
    self.disLink = nil;
}

- (void)dealloc{
    
}

@end
