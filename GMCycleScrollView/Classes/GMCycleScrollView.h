//
//  GMCycleScrollView.h
//  GMCycleScrollView
//
//  Created by 于学良 on 2017/12/14.
//

#import <UIKit/UIKit.h>
//PageControl 位置
typedef NS_ENUM(NSInteger,PageControlAliment){
    PageContolAlimentRight,
    PageContolAlimentCenter,
    PageContolAlimentLeft,
};
@class GMCycleScrollView;
@protocol GMCycleScrollViewDelegate <NSObject>
@optional
//banner 点击事件
- (void)cycleScrollView:(GMCycleScrollView *)cycleScrollView didSelectAtIndex:(NSInteger)index;
@end

@interface GMCycleScrollView : UIView
+(instancetype)cycleScrollViewWithFrame:(CGRect)frame imageNamesGroup:(NSArray*)imageNameGroup;
+(instancetype)cycleScrollViewWithFrame:(CGRect)frame imageUrlsGroup:(NSArray*)imageUrlsGroup;
+(instancetype)cycleScrollViewWithFrame:(CGRect)frame imageNamesGroup:(NSArray*)imageNameGroup cycleLoop:(BOOL)isCycleLoop;

/** 解决轮播图卡在一半的问题，在控制器viewWillAppear时调用此方法 */
- (void)adjustWhenControllerViewWillAppera;

@property(nonatomic,weak)id<GMCycleScrollViewDelegate>delegate;
/** 数据源 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;//网络图片url string数组
@property (nonatomic, strong) NSArray *titlesGroup;//每张图片对应要显示的文字数组
@property (nonatomic, strong) NSArray *localizationImageNamesGroup;//本地图片数组
@property (nonatomic, strong) UIImage *placeholderImage;//占位图，用于网络未加载到图片时

/** UI风格 */
@property(nonatomic,assign) BOOL isCycleLoop; //是否无限循环，默认NO
@property(nonatomic,assign) BOOL isAutoScroll; //是否自动滚动，默认YES
@property(nonatomic,assign) BOOL isShowPageControl; //是否显示PageControl
@property(nonatomic,assign) BOOL isShowBannerTitle; //banner是否显示文字
@property(nonatomic,assign) PageControlAliment pageControlAliment;
/**Config*/
@property(nonatomic,assign) CGFloat autoScrollTimeInterval;//自动轮播间隔时间
@property(nonatomic,strong) UIColor *pageIndicatorTintColor;//pageControl 圆点颜色
@property(nonatomic,strong) UIColor *currentPageIndicatorTintColor;//pageControl 当前页圆点颜色

@property(nonatomic,assign) CGFloat titleLableHeight; //标题高
@property (nonatomic, strong) UIColor *titleLabelTextColor;//标题颜色
@property (nonatomic, strong) UIFont *titleLabelTextFont;//标题字体
@property (nonatomic, assign) NSTextAlignment titleLabelTextAlignment;//标题位置
/** 自定义设置 */

@end
