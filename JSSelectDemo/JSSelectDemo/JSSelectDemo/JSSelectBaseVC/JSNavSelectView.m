
#import "JSNavSelectView.h"
#define SupRadius 15
#define SelectRadius 14
#define ViewSize self.frame.size
#define ViewOrigin self.frame.origin

@interface JSNavSelectView ()

@property (nonatomic, strong) NSArray * titleArray;
@property (nonatomic,strong) UIView *supBGView;
@property (nonatomic,strong) UIView *selectView;
@property (nonatomic,strong) NSMutableArray *btnArr;

@end

@implementation JSNavSelectView

- (instancetype)initWithtitleArray:(NSArray *)titleArray{
    
    if (self = [super init]) {
        _titleArray = titleArray;
        _BGColor = [UIColor whiteColor];
        _selectItemBackgroundColor = [UIColor colorWithRed:73/255.0 green:116/255.0 blue:242/255.0 alpha:1.0];
        _titleNotSelectColor = [UIColor colorWithRed:174/255.0 green:182/255.0 blue:198/255.0 alpha:1.0];
        _titleSelectColor = [UIColor whiteColor];
        _titleFont = 14;
        [self initNavSelectView];
        
    }
    return self;
}

/**
 * 初始化
 */
- (void)initNavSelectView{
    
    self.supBGView = [[UIView alloc] init];
    self.supBGView.layer.cornerRadius = SupRadius;
    self.supBGView.layer.masksToBounds = YES;
    self.supBGView.backgroundColor = _BGColor;
    [self addSubview:self.supBGView];
    
    self.selectView = [[UIView alloc] init];
    self.selectView.layer.borderWidth = 1.5;
    self.selectView.layer.borderColor = [_BGColor CGColor];
    self.selectView.layer.cornerRadius = SupRadius;
    self.selectView.layer.masksToBounds = YES;
    self.selectView.backgroundColor = _selectItemBackgroundColor;
    [self.supBGView addSubview:self.selectView];
    
    self.btnArr = [NSMutableArray array];
    //添加按钮
    for (int i = 0; i<self.titleArray.count; i++) {
        UIButton *titleBtn = [[UIButton alloc] init];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:_titleFont];
        [titleBtn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [titleBtn setTitleColor:_titleNotSelectColor forState:UIControlStateNormal];
        [titleBtn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
        [titleBtn setBackgroundColor:[UIColor clearColor]];
        titleBtn.tag = i;
        if (i==0) {
            titleBtn.selected = YES;
        }
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnArr addObject:titleBtn];
        [self.supBGView addSubview:titleBtn];
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.supBGView.frame = self.frame;
    self.selectView.frame = CGRectMake(self.selectIndex*(ViewSize.width/self.titleArray.count), 0, ViewSize.width/self.titleArray.count, ViewSize.height);
    
    for (int i = 0; i<self.titleArray.count; i++) {
        UIButton *titleBtn = self.btnArr[i];
        CGFloat btnX = i*ViewSize.width/self.titleArray.count;
        titleBtn.frame = CGRectMake(btnX, 0, ViewSize.width/self.titleArray.count, ViewSize.height);
    }
}

/**
 * 按钮点击事件
 */
- (void)titleBtnClick:(UIButton *)btn{
    //NSLog(@"点击按钮：%ld",btn.tag);
    for (int i = 0; i<self.btnArr.count; i++) {
        UIButton *titleBtn = self.btnArr[i];
        if (btn.tag==i) {
            titleBtn.selected = YES;
        }else{
            titleBtn.selected = NO;
        }
    }
    [UIView animateWithDuration:0.25 animations:^{
        CGRect selectR = self.selectView.frame;
        selectR.origin.x = btn.tag*(ViewSize.width/self.titleArray.count);
        self.selectView.frame = selectR;
    }];
    if ([self.delegate respondsToSelector:@selector(customNavSelectViewBtn:SelectIndex:)]) {
        [self.delegate customNavSelectViewBtn:btn SelectIndex:btn.tag];
    }
}
#pragma setter & getter
- (void)setBGColor:(UIColor *)BGColor{
    _BGColor = BGColor;
    self.supBGView.backgroundColor = BGColor;
    self.selectView.layer.borderColor = [BGColor CGColor];
}
- (void)setSelectItemBackgroundColor:(UIColor *)selectItemBackgroundColor{
    _selectItemBackgroundColor = selectItemBackgroundColor;
    self.selectView.backgroundColor = selectItemBackgroundColor;
}
- (void)setTitleFont:(CGFloat)titleFont{
    _titleFont = titleFont;
    for (UIButton *btn in self.btnArr) {
        btn.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
}
- (void)setTitleSelectColor:(UIColor *)titleSelectColor{
    _titleSelectColor = titleSelectColor;
    for (UIButton *btn in self.btnArr) {
        [btn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
    }
}
- (void)setTitleNotSelectColor:(UIColor *)titleNotSelectColor{
    _titleNotSelectColor = titleNotSelectColor;
    for (UIButton *btn in self.btnArr) {
        [btn setTitleColor:_titleNotSelectColor forState:UIControlStateNormal];
    }
}
- (void)setSelectIndex:(NSInteger)selectIndex{
    
    _selectIndex = selectIndex;
    for (int i = 0; i<self.titleArray.count; i++) {
        UIButton *titleBtn = self.btnArr[i];
        if (selectIndex==i) {
            titleBtn.selected = YES;
        }else{
            titleBtn.selected = NO;
        }
    }
}

@end
