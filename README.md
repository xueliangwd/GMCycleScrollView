# GMCycleScrollView



## Example

*  实现banner轮播图，可支持无限轮播、自动轮播；banner图片源可传本地图，也可传图片url地址；
*  pagerConrol和banner上的标题可显示可隐藏；支持layout设置frame布局。
*  实现方案，采用UICollectionView做容器，无限轮播banner数（n）乘1000，达到边界时再重置到初始位置。
*  解决轮播出现半屏问题、banner空白问题。
*  使用头文件引用#import "GMCycleScrollView.h"，如自定义属性较多建议通过类别（category）使用，可参考示例Demon。

```
类别封装：
+(instancetype)clientCycleScrollViewWithFrame:(CGRect)frame{
GMCycleScrollView *cycleScrollView = [[GMCycleScrollView alloc]initWithFrame:frame];
cycleScrollView.isCycleLoop = YES;
cycleScrollView.isShowPageControl = YES;
cycleScrollView.isShowBannerTitle = YES;
cycleScrollView.isAutoScroll = YES;
cycleScrollView.autoScrollTimeInterval = 2.0;
cycleScrollView.localizationImageNamesGroup = @[@"h1.jpg",
@"h2.jpg",
@"h3.jpg",
@"h4.jpg"                                                    ];

cycleScrollView.titlesGroup = @[@"标题1",@"标题2",@"Title3",@"Title4"];
return cycleScrollView;
}
调用示例：
GMCycleScrollView * clientScrollView = [GMCycleScrollView clientCycleScrollViewWithFrame:CGRectMake(0, 64,
self.view.bounds.size.width, 200)];
[self.view addSubview:clientScrollView];
```

## Requirements

## Installation

GMCycleScrollView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GMCycleScrollView'
```

## Author

yuxueliang, yuxueliang@gomeplus.com

## License

GMCycleScrollView is available under the MIT license. See the LICENSE file for more info.
