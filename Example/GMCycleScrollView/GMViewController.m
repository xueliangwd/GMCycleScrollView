//
//  GMViewController.m
//  GMCycleScrollView
//
//  Created by yuxueliang on 12/14/2017.
//  Copyright (c) 2017 yuxueliang. All rights reserved.
//

#import "GMViewController.h"
#import <GMCycleScrollView/GMCycleScrollView.h>
#import "Masonry.h"

@interface GMViewController ()

@end

@implementation GMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    GMCycleScrollView *cycleScrollView = [[GMCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
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
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(210.0);
    }];

    GMCycleScrollView *urlScrollView = [GMCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 301, self.view.bounds.size.width, 200) imageUrlsGroup: @[
                                                                                                                                                          @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                                                                                                                                          @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                                                                                                                                          @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                                                                                                                                          ]];
    urlScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    urlScrollView.isCycleLoop = YES;
    cycleScrollView.isAutoScroll = YES;
    [self.view addSubview:urlScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
