//
//  GMCycleScrollView.h
//  GMCycleScrollView
//
//  Created by 于学良 on 2017/12/14.
//

#import <UIKit/UIKit.h>
//PageControl 位置
typedef NS_ENUM(NSInteger,PageContolAliment){
    PageContolAlimentRight,
    PageContolAlimentCenter,
    PageContolAlimentLeft,
};

@protocol GMCycleScrollViewDelegate <NSObject>

@end

@interface GMCycleScrollView : UIView
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

/**Config*/
@property(nonatomic,assign) CGFloat autoScrollTimeInterval;
/** 自定义设置 */

@end
