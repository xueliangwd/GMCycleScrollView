//
//  GMCycleScrollViewCell.m
//  GMCycleScrollView
//
//  Created by 于学良 on 2017/12/14.
//

#import "GMCycleScrollViewCell.h"
@interface GMCycleScrollViewCell(){
    UIImageView *_imageView;
    UILabel *_titleLabel;
}
@end
@implementation GMCycleScrollViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpImageView];
        [self setUpTitleLabel];
    }
    return self;
}
-(void)setUpImageView{
    _imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_imageView];
}
-(void)setUpTitleLabel{
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.hidden = YES;
    [self.contentView addSubview:_titleLabel];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _titleLabel.frame = CGRectMake(0, self.bounds.size.height - _titleLabelHeight    , self.bounds.size.width, _titleLabelHeight);
}
#pragma mark property
-(void)setTitle:(NSString *)title{
    _title = title;
    _titleLabel.text = title;
    if (_titleLabel.hidden) {
        _titleLabel.hidden = NO;
    }
}
-(void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor{
    _titleLabelTextColor = titleLabelTextColor;
    _titleLabel.textColor = titleLabelTextColor;
}
-(void)setTitleLabelTextFont:(UIFont *)titleLabelTextFont{
    _titleLabelTextFont = titleLabelTextFont;
    _titleLabel.font = titleLabelTextFont;
}
-(void)setTitleLabelTextAlignment:(NSTextAlignment)titleLabelTextAlignment{
    _titleLabelTextAlignment = titleLabelTextAlignment;
    _titleLabel.textAlignment = titleLabelTextAlignment;
}
@end
