//
//  FCTableViewCell.m
//  SimpleTab
//
//  Created by 方存 on 2020/3/23.
//  Copyright © 2020 JKB. All rights reserved.
//

#import "FCTableViewCell.h"
#import "FCModel.h"
#import "Masonry.h"
#import "FCCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "SDPhotoBrowser.h"

#define item_num 3
#define pading 10

//static CGFloat item_num = 3;
//static CGFloat pading = 10;

@interface FCTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource, SDPhotoBrowserDelegate>

@property(nonatomic, strong)UILabel *dateLb;
@property(nonatomic, strong)UILabel *tagLb;
@property (nonatomic,strong)UICollectionView *collectView;
@property(nonatomic, strong)UILabel *contentLb;
@property (nonatomic,strong)UIView *line;

@end

@implementation FCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        [self setupLayout];
    }
    return self;
}

- (void)setupUI
{
    [self.contentView addSubview:self.dateLb];
    [self.contentView addSubview:self.tagLb];
    [self.contentView addSubview:self.collectView];
    [self.contentView addSubview:self.contentLb];
    [self.contentView addSubview:self.line];
}

- (void)setupLayout
{
    [self.dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(10);
    }];
    
    [self.tagLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).mas_offset(-15);
        make.centerY.equalTo(self.dateLb.mas_centerY);
        make.height.mas_equalTo(20);
    }];

    [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(self.dateLb.mas_bottom).mas_offset(10);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 30);
        // 设置初始高度
        make.height.mas_equalTo(@1).priorityLow();
    }];

    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.collectView.mas_left);
        make.top.equalTo(self.collectView.mas_bottom).mas_offset(10);
        make.width.equalTo(self.collectView.mas_width);
    }];

    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 30);
        make.height.mas_equalTo(@1.0);
        make.left.equalTo(self.contentLb.mas_left);
    }];
}

- (void)setModel:(FCModel *)model {
    _model = model;
    self.dateLb.text = model.date;
    self.tagLb.text = [NSString stringWithFormat:@"  %@  ", model.type];
    self.contentLb.text = model.textContent;
    [self reloadCell:model.imageArr];
}

- (void)reloadCell:(NSArray *)imgarr
{
    //更新collectionView
    [self.collectView reloadData];
    [self.collectView layoutIfNeeded];
    [self.collectView setNeedsLayout];
    
    CGFloat h_collectionview;
    if (imgarr.count > 0) {
        CGFloat h = self.collectView.collectionViewLayout.collectionViewContentSize.height;
        NSLog(@"高 == %f", h);
        h_collectionview = h;
    }else {
        h_collectionview = 5;
    }
    [self.collectView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(h_collectionview);
    }];
}

+ (CGFloat)returnCellH:(FCModel *)model
{
    CGFloat h = 1;
    // 高
    CGFloat itemH = ([UIScreen mainScreen].bounds.size.width - 30 - ((item_num-1)*pading))/item_num;
    if (model.imageArr.count > 0) {
        NSUInteger rows = (model.imageArr.count + item_num - 1) / item_num;
        h = itemH * rows + (rows-1) *pading;
    }
    CGFloat texth = [FCTableViewCell returenTextHeightWihtText:model.textContent Font:[UIFont systemFontOfSize:13] defaultWidth:[UIScreen mainScreen].bounds.size.width-30];
    if (model.textContent.length < 1) {
        return 45 + h + 15;
    }else{
        return 45 + h + 10 + texth + 10;
    }
}

/** 计算文字高度 */
+ (CGFloat)returenTextHeightWihtText:(NSString *)text Font:(UIFont *)textFont defaultWidth:(CGFloat)textWidth
{
    NSDictionary * attrs = [NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName,nil];
    CGRect S = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    return S.size.height;
}

#pragma mark - CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *tagsArr = _model.imageArr;
    return tagsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSArray *tagsArr = _model.imageArr;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:tagsArr[indexPath.row]] placeholderImage:[UIImage imageNamed:@"zahnweitu"]];
    return cell;
}

// 设置间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

// 设置大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat item_height = ([UIScreen mainScreen].bounds.size.width-30 - ((item_num-1)*pading))/item_num;
    CGSize size = CGSizeMake(item_height,item_height);
    return size;
}

// 上下cell的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

// 左右cell的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SDPhotoBrowser * broser = [[SDPhotoBrowser alloc] init];
    broser.currentImageIndex = indexPath.row;
    broser.sourceImagesContainerView = self.collectView;
    NSArray *tagsArr = _model.imageArr;
    broser.imageCount = tagsArr.count;
    broser.delegate = self;
    [broser show];
}

#pragma mark - SDPhotoBrowserDelegate
// 返回高质量图片的url
- (NSURL*)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSString *str in _model.imageArr) {
        [arr addObject:str];
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", arr[index]]];
    return url;
}

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
    UIImage *img = [UIImage imageNamed:@"zhanweitu"];
    return img;
}

#pragma mark - lazy
- (UILabel *)dateLb {
    if (!_dateLb) {
        _dateLb = [[UILabel alloc] init];
        _dateLb.font = [UIFont systemFontOfSize:15];
    }
    return _dateLb;
}

- (UILabel *)tagLb {
    if (!_tagLb) {
        _tagLb = [[UILabel alloc] init];
        _tagLb.font = [UIFont systemFontOfSize:13];
        _tagLb.backgroundColor = [UIColor lightGrayColor];
        _tagLb.textColor = [UIColor whiteColor];
        _tagLb.layer.masksToBounds = YES;
        _tagLb.layer.cornerRadius = 3.f;
    }
    return _tagLb;
}

- (UICollectionView *)collectView{
    if (!_collectView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectView.backgroundColor = [UIColor whiteColor];
        _collectView.delegate = self;
        _collectView.dataSource = self;
        [_collectView registerClass:[FCCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectView;
}

- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [[UILabel alloc] init];
        _contentLb.font = [UIFont systemFontOfSize:13];
        _contentLb.numberOfLines = 0;
    }
    return _contentLb;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
