//
//  ViewController.m
//  QQLPathButtonMenu
//
//  Created by alonsolu on 16/7/13.
//  Copyright © 2016年 alonsolu. All rights reserved.
//

#import "ViewController.h"
#import "QQLPathButtonItem.h"
#import "QQLPathButtonMenu.h"

@interface ViewController ()

@end

@implementation ViewController {
  QQLPathButtonMenu *pathMenu;
  UIButton *mainButton;
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  QQLPathButtonItem *pathItem1 = [QQLPathButtonItem buttonWithImage:[UIImage imageNamed:@"PathEdit"] title:@"one"];
  pathItem1.expandAngle = M_PI_4;
  pathItem1.tag = 1;
  
  QQLPathButtonItem *pathItem2 = [QQLPathButtonItem buttonWithImage:[UIImage imageNamed:@"PathEdit"] title:@"two"];//  [pathItem2 setBackgroundImage:[UIImage imageNamed:@"PathEdit"] forState:UIControlStateNormal];
  pathItem2.expandAngle = M_PI_2;
  pathItem2.tag = 2;
  
  QQLPathButtonItem *pathItem3 = [QQLPathButtonItem buttonWithImage:[UIImage imageNamed:@"PathEdit"] title:@"one"];//  [pathItem3 setBackgroundImage:[UIImage imageNamed:@"PathEdit"] forState:UIControlStateNormal];
  pathItem3.tag = 3;
  pathItem3.expandAngle = M_PI_4 * 3;

  mainButton = [UIButton buttonWithType:UIButtonTypeCustom];
  mainButton.frame = CGRectMake((self.view.frame.size.width - 72)/2.0, (self.view.frame.size.height - 72)/2.0, 72, 72);
 [mainButton setBackgroundImage:[UIImage imageNamed:@"PathMain"] forState:UIControlStateNormal];
  [self.view addSubview:mainButton];

  UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
  closeButton.frame = CGRectMake((self.view.frame.size.width - 72)/2.0, 500, 72, 72);
  [closeButton setBackgroundImage:[UIImage imageNamed:@"PathMain"] forState:UIControlStateNormal];
  
  pathMenu = [[QQLPathButtonMenu alloc]initWithMainButton:mainButton
                                              closeButton:closeButton
                                               menuArrays:@[pathItem1, pathItem2, pathItem3]
                                          backgroundColor:[UIColor yellowColor]];
  pathMenu.menuClickBlock = ^(NSInteger buttonIndex){
    NSLog(@"index %ld", buttonIndex);
  };
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
