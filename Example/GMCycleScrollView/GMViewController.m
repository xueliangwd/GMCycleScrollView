//
//  GMViewController.m
//  GMCycleScrollView
//
//  Created by yuxueliang on 12/14/2017.
//  Copyright (c) 2017 yuxueliang. All rights reserved.
//

#import "GMViewController.h"
#import <GMCycleScrollView/GMCycleScrollView.h>
@interface GMViewController ()

@end

@implementation GMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    GMCycleScrollView *cycleScrollView = [[GMCycleScrollView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
    cycleScrollView.isCycleLoop = YES;
    cycleScrollView.isShowPageControl = YES;
    cycleScrollView.isShowBannerTitle = YES;
    cycleScrollView.isAutoScroll = YES;
    cycleScrollView.autoScrollTimeInterval = 2.0;
    cycleScrollView.localizationImageNamesGroup = @[@"h1.jpg",
                                                    @"h2.jpg",
                                                    @"h3.jpg",
                                                    @"h4.jpg"                                                    ];
    
    cycleScrollView.titlesGroup = @[@"测试banner Title1",@"测试banner Title2",@"Title3",@"Title4"];
    [self.view addSubview:cycleScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
