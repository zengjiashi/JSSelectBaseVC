

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JSNavSelectViewDelegate <NSObject>
@required
- (void)customNavSelectViewBtn:(UIButton *)titleBtn SelectIndex:(NSInteger)selectIndex;

@end

@interface JSNavSelectView : UIView

/**
 *  背景颜色 默认 [UIColor whiteColor]
 */
@property (nonatomic, copy) UIColor * BGColor;

/**
 *  选中状态下item背景颜色 默认 [UIColor #3574FA]
 */
@property (nonatomic, copy) UIColor * selectItemBackgroundColor;

/**
 *  选中状态下item字体颜色 默认 [UIColor whiteColor]
 */
@property (nonatomic, copy) UIColor * titleSelectColor;
/**
 *  未选中状态下item字体颜色 默认 [UIColor #A0ACC0]
 */
@property (nonatomic, copy) UIColor * titleNotSelectColor;

/**
 *  item字体大小 默认 14
 */
@property (nonatomic, assign) CGFloat titleFont;

/**
 *  选中第几个item 默认 0
 */
@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic,assign) id<JSNavSelectViewDelegate> delegate;

- (instancetype)initWithtitleArray:(NSArray *)titleArray;

@end

NS_ASSUME_NONNULL_END
