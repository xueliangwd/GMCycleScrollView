//
//  GMCycleScrollViewCell.h
//  GMCycleScrollView
//
//  Created by 于学良 on 2017/12/14.
//

#import <UIKit/UIKit.h>

@interface GMCycleScrollViewCell : UICollectionViewCell
@property(nonatomic,assign) BOOL hasConfig;//标记是否配置过cell UI属性
@property(nonatomic,strong)UIImageView *imageView;

@property(nonatomic,strong)NSString *title;
@property (nonatomic, strong) UIColor *titleLabelTextColor;
@property (nonatomic, strong) UIFont *titleLabelTextFont;
@property (nonatomic, assign) CGFloat titleLabelHeight;
@property (nonatomic, assign) NSTextAlignment titleLabelTextAlignment;
@end
