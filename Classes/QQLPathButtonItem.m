//
//  QQLPathButtonItem.m
//  Pods
//
//  Created by alonsolu on 16/7/13.
//
//

#import "QQLPathButtonItem.h"

@interface QQLPathButtonItem ()


@property (unsafe_unretained, nonatomic) IBOutlet UILabel *label;

@end
@implementation QQLPathButtonItem 
+ (instancetype)buttonWithImage:(UIImage *)image title:(NSString *)title {
  QQLPathButtonItem *item = [[QQLPathButtonItem alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
  [item.button setImage:image forState:UIControlStateNormal];
  return item;
}

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil][0];
    self.backgroundColor = [UIColor clearColor];
  }
  return self;
}

@end
