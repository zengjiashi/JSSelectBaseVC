

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSSelectViewController : UIViewController

@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *controllerArr;
@property (nonatomic,assign) CGRect selectViewFrame;
@property (nonatomic,assign) NSInteger selectIndex;
@end

NS_ASSUME_NONNULL_END
