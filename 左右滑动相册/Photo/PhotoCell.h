//
//  PhotoCell.h
//  左右滑动相册
//
//  Created by mac on 2021/3/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCell : UICollectionViewCell

+ (void) registNib:(UICollectionView *) collectionView flagName:(NSString *) flageName;

@end

NS_ASSUME_NONNULL_END
