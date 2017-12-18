//
//  GMCycleScrollView.m
//  GMCycleScrollView
//
//  Created by 于学良 on 2017/12/14.
//

#import "GMCycleScrollView.h"
#import "GMCycleScrollViewCell.h"
#import "UIImageView+WebCache.h"

NSString *const  cellID = @"GMCycleScrollViewCellID";
@interface GMCycleScrollView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *mainView; //轮播容器
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,assign) NSUInteger totalPagesCount; //设置轮播的总长度个数
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, strong) NSArray *imagePathsGroup;

@end
@implementation GMCycleScrollView
//代码初始化
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initialization];
        [self setUpMainView];

    }
    return self;
}
//xib 初始化
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initialization];
    [self setUpMainView];
}
//数据初始化
-(void)initialization{
    
}
-(void)setUpMainView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowLayout = flowLayout;

    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    mainView.backgroundColor = [UIColor clearColor];
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[GMCycleScrollView class] forCellWithReuseIdentifier:cellID];

    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [self addSubview:mainView];
    _mainView = mainView;
}

//支持autolayout 及时调整Frame
-(void)layoutSubviews{
    [super layoutSubviews];
    //设置subviews 的frame

}
#pragma mark Timer
-(void)invilidTimer{
    [_timer invalidate];
    _timer = nil;
}
-(void)setUpTimer{
    [self invilidTimer]; //先释放之前的timer，保证只有一个timer
    _timer = [NSTimer scheduledTimerWithTimeInterval:_autoScrollTimeInterval target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

}
-(void)automaticScroll{
    if (_totalPagesCount==0) return;
    NSInteger cellIndex = [self cellIndex];
    cellIndex ++;
    [self scollToIndex:cellIndex];
}
-(void)scollToIndex:(NSInteger)index{
    if (index >= _totalPagesCount) {
        if (self.isCycleLoop) {
            index = _totalPagesCount * 0.5;
            [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }
        return;
    }
    [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}
#pragma mark pageControl
-(void)setUpPageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        [self addSubview:_pageControl];
    }
    //config Pageconrol
    _pageControl.numberOfPages = self.imagePathsGroup.count;
    _pageControl.currentPage = [self pageIndexWithCellIndex:[self cellIndex]];
}
-(NSInteger)cellIndex{
    NSInteger index = 0;
    index = (_mainView.contentOffset.x + _flowLayout.itemSize.width * 0.5) / _flowLayout.itemSize.width;
    return index;
}
-(NSInteger)pageIndexWithCellIndex:(NSInteger)index{
    return index%self.imagePathsGroup.count;
}
#pragma mark property
-(void)setImagePathsGroup:(NSArray *)imagePathsGroup{
    _imagePathsGroup = imagePathsGroup;
    _totalPagesCount = _isCycleLoop?_imagePathsGroup.count*100:imagePathsGroup.count;
    //重置pagecontrol
    [self setUpPageControl];
    [_mainView reloadData];
}
#pragma mark UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.totalPagesCount;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GMCycleScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (!cell.hasConfig) {
        cell.hasConfig = YES;
    }
    NSInteger currentIndex = [self pageIndexWithCellIndex:indexPath.item];
    NSString *imagePath = _imagePathsGroup[currentIndex];
    if ([imagePath isKindOfClass:[UIImage class]]) {
        UIImage *image = (UIImage*)imagePath;
        cell.imageView.image = image;
    }else{
        if ([imagePath hasPrefix:@"http"]) {
//             [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:self.placeholderImage];
        }else{
            cell.imageView.image = [UIImage imageNamed:imagePath];
        }
    }
    if (_isShowBannerTitle&& currentIndex < _titlesGroup.count) {
        cell.title = _titlesGroup[currentIndex];
    }
    return cell;
}
#pragma mark UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click index:%ld",indexPath.row);

}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.imagePathsGroup.count) return;
    //滚动切换 pagecontrol
    NSInteger index = [self pageIndexWithCellIndex:[self cellIndex]];
    _pageControl.currentPage = index;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.isCycleLoop) {
        [self invilidTimer];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.isCycleLoop) {
        [self setUpTimer];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:self.mainView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (!self.imagePathsGroup.count) return;
    //滚动切换 pagecontrol
    NSInteger index = [self pageIndexWithCellIndex:[self cellIndex]];
    _pageControl.currentPage = index;
}
@end

