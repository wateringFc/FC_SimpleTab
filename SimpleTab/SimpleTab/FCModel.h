//
//  FCModel.h
//  SimpleTab
//
//  Created by 方存 on 2020/3/23.
//  Copyright © 2020 JKB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCModel : NSObject

// 时间
@property(nonatomic, copy)NSString *date;
// 类型
@property(nonatomic, copy)NSString *type;
// 文字内容
@property(nonatomic, copy)NSString *textContent;
//图片
@property(nonatomic, strong)NSArray *imageArr;
//id
@property(nonatomic, copy)NSString *idStr;

@end

NS_ASSUME_NONNULL_END
