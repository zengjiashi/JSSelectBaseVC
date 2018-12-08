

#import "JSSelectViewController.h"
#import "JSNavSelectView.h"

@interface JSSelectViewController ()<JSNavSelectViewDelegate>

@property (nonatomic,strong) UIViewController *currentViewController;
@property (nonatomic,assign) NSInteger currentIndex;

@end


@implementation JSSelectViewController

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //移除child view controller
     //removeFromParentViewController在移除child前不会调用[self willMoveToParentViewController:nil] ，所以需要显示调用
    for (UIViewController *vc in self.controllerArr) {
        [vc didMoveToParentViewController:self];
        [vc willMoveToParentViewController:nil];
        [vc removeFromParentViewController];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavSelectView];
    [self initSelectViewController];
}

/**
 * 初始化
 */
- (void)initNavSelectView{
    
    JSNavSelectView *selectView = [[JSNavSelectView alloc] initWithtitleArray:self.titleArr];
    selectView.frame = self.selectViewFrame;
    selectView.selectIndex = self.selectIndex;
    self.currentIndex = self.selectIndex;
    selectView.delegate = self;
    self.navigationItem.titleView = selectView;
    
}

- (void)initSelectViewController{
    
    for (UIViewController *vc in self.controllerArr) {
        [self addChildViewController:vc];
    }
    UIViewController *firstVC = self.controllerArr[self.selectIndex];
    [firstVC didMoveToParentViewController:self];
    [self.view addSubview:firstVC.view];
    self.currentViewController = firstVC;
}

#pragma JSNavSelectViewDelegate
- (void)customNavSelectViewBtn:(UIButton *)titleBtn SelectIndex:(NSInteger)selectIndex{
    
    if (self.currentIndex==selectIndex) {
        return;
    }
    UIViewController *toViewController = self.controllerArr[selectIndex];
    [self transitionFromViewController:self.currentViewController toViewController:toViewController duration:0.25 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
    } completion:^(BOOL finished) {
    
        self.currentIndex = selectIndex;
        self.currentViewController = self.controllerArr[selectIndex];
    }];
}

@end
