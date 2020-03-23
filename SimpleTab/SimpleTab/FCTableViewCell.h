//
//  FCTableViewCell.h
//  SimpleTab
//
//  Created by 方存 on 2020/3/23.
//  Copyright © 2020 JKB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FCModel;

NS_ASSUME_NONNULL_BEGIN

@interface FCTableViewCell : UITableViewCell

@property(nonatomic, strong)FCModel *model;

+ (CGFloat)returnCellH:(FCModel *)model;

@end

NS_ASSUME_NONNULL_END
