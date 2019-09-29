//
//  ViewController.m
//  KJXIBAdaptiveDemo
//
//  Created by 杨科军 on 2019/9/29.
//  Copyright © 2019 杨科军. All rights reserved.
//

#import "ViewController.h"
#import "KJTestView.h"
#import "KJAdaptiveTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    KJTestView *view = [[[NSBundle mainBundle] loadNibNamed:@"KJTestView" owner:nil options:nil] lastObject];
    view.frame = self.view.bounds;
    [self.view addSubview:view];
}

@end
