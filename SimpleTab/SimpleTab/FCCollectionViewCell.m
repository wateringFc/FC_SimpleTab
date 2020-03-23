//
//  FCCollectionViewCell.m
//  SimpleTab
//
//  Created by 方存 on 2020/3/23.
//  Copyright © 2020 JKB. All rights reserved.
//

#import "FCCollectionViewCell.h"

@interface FCCollectionViewCell ()



@end

@implementation FCCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode=UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = 2.0; // 如果裁剪，会有bug
    }
    return _imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.frame;
}


@end
