//
//  QQLPathButtonMenu.m
//  Pods
//
//  Created by alonsolu on 16/7/13.
//
//

#import "QQLPathButtonMenu.h"
#import "QQLPathButtonItem.h"

//paht展开动画时，远点、近点、终点的展开半径
static CGFloat const kFarRadius = 140.0f;
static CGFloat const kNearRadius = 110.0f;
static CGFloat const kEndRadius = 120.0f;
static float const kDuration = .3f;

@interface QQLPathButtonMenu ()
@property (nonatomic, strong) UIView *pathSuperView;
@property (nonatomic, weak) UIView *mainButtonSuperView;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) NSArray *menusArray;
@property (nonatomic, strong) QQLPathButtonMenuConfig *config;
@end

@implementation QQLPathButtonMenu

- (instancetype)initWithMainButton:(UIButton *)mainButton
                       closeButton:(UIButton*)closeButton
                        menuArrays:(NSArray *)menusArray
                            config:(QQLPathButtonMenuConfig *)config {
  if (self = [super initWithFrame:mainButton.frame]) {
    _config = config;
    [mainButton addTarget:self action:@selector(mainButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.mainButtonSuperView = mainButton.superview;
    self.pathSuperView = [[UIView alloc]initWithFrame:mainButton.superview.frame];
    self.pathSuperView.backgroundColor = config.backgroundViewColor;
    
    self.closeButton = closeButton;
    [self.closeButton addTarget:self action:@selector(mainButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.pathSuperView addSubview:closeButton];
    
    [self setMenusArray:menusArray withMainButton:mainButton];
    self.menusArray = menusArray;
  }
  return self;
}

- (void)setMenusArray:(NSArray *)menusArray withMainButton:(UIButton*)mainButton {
  if (_menusArray != menusArray) {
    _menusArray = nil;
    _menusArray = [menusArray copy];
    
    for (QQLPathButtonItem *item  in _menusArray) {
      [item.button addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
      item.frame = mainButton.frame;
      item.startPoint = mainButton.center;
//      item.farPoint = CGPointMake(mainButton.center.x + kFarRadius * cos(item.expandAngle), mainButton.center.y - kFarRadius * sin(item.expandAngle));
//      item.nearPoint = CGPointMake(mainButton.center.x + kNearRadius * cos(item.expandAngle), mainButton.center.y - kNearRadius * sin(item.expandAngle));
      item.endPoint = CGPointMake(mainButton.center.x + (_config.endRadius ?: kEndRadius) * cos(item.expandAngle), mainButton.center.y - kEndRadius * sin(item.expandAngle));
      item.hidden = YES;
      [self.pathSuperView addSubview:item];
    }
  }
}

- (void)menuAction:(UIButton *)button {
  
  if (self.menuClickBlock) {
    self.menuClickBlock(button.tag);
  }
  
  //有动画效果
  [self mainButtonAction:button];
  
  //点击菜单进入新界面不要动画时
  //    [self hideMenus];
}

- (void)hideMenusWithMainButton:(UIButton*)mainButton {
  
  mainButton.transform = CGAffineTransformMakeRotation(0);
  for (QQLPathButtonItem *item in self.menusArray) {
    item.center = mainButton.center;
  }
}

-(void)mainButtonAction:(UIButton*)sender {
  
  if (self.isExpanding) {
    [self shrink];
  }else{
    [self expand];
  }
  
  self.expanding = !self.expanding;
  
//  float angle = self.isExpanding ? -M_PI_4 : 0.0f;
//  [UIView animateWithDuration:0.3f animations:^{
//    sender.transform = CGAffineTransformMakeRotation(angle);
//  }];
}

-(void)expand {
  [_mainButtonSuperView addSubview:self.pathSuperView];
  for (QQLPathButtonItem *item in self.menusArray) {
    [self expand:item scale:1];
  }
}

-(void)expand:(QQLPathButtonItem *)button scale:(CGFloat)scale {
  button.hidden = NO;
  [UIView animateWithDuration:self.config.duration ?: kDuration animations:^{
    button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 72 * scale, 72 * scale);
    button.center = button.endPoint;
  }];
}


-(void)shrink {
  [self.pathSuperView removeFromSuperview];
  for (QQLPathButtonItem *item in self.menusArray) {
    [self shrink:item scale:.8];
  }
}

-(void)shrink:(QQLPathButtonItem *)button scale:(CGFloat)scale {
  [UIView animateWithDuration:self.config.duration ?: kDuration animations:^{
    button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 72 * scale, 72 * scale);
    button.center = button.startPoint;
  } completion:^(BOOL finished) {
    button.hidden = YES;
  }];
}

@end

@implementation QQLPathButtonMenuConfig

@end
