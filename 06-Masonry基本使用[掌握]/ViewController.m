//
//  ViewController.m
//  06-Masonry基本使用[掌握]
//
//  Created by apple on 15-5-27.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
//必须导入之前定义
//可以省略mas_前缀
#define MAS_SHORTHAND
//自动装箱
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    在控制器上添加一个控件，距离控制器View上下左右各20
    
//  1.创建子控件,添加到控制器的view中
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
//  2.通过masonry添加约束
    __weak typeof(self) weakSelf = self;
  /*
    练习2
     控制器的view中有红色View和蓝色View
     要求
     蓝色view距离控制器的view顶部以及左右都是20,高度为100
     红色的view与控制器view的右边的间距也为20
     红色view在蓝色view下方,红色view与蓝色view之间的间隔为20
     红色view与蓝色view的高度相同,宽度是蓝色view的一半
   */
//  给蓝色view添加约束
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf.view).offset(20);
        make.height.equalTo(100);
        make.right.equalTo(weakSelf.view.right).offset(-20);
    }];
    
//  给红色view添加约束
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blueView.bottom).offset(20);
        make.right.equalTo(blueView.right);
        make.height.equalTo(blueView.height);
//      multipliedBy 乘以
        make.width.equalTo(blueView.width).multipliedBy(0.5);
    }];
    
    
}



- (void) masonryBasicUse
{
    //    在控制器上添加一个控件，距离控制器View上下左右各20
    
    //  1.创建子控件,添加到控制器的view中
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    //  2.通过masonry添加约束
    __weak typeof(self) weakSelf = self;
    
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    ////      第一种方式:
    //        make.top.equalTo(weakSelf.view.mas_top).offset(20);
    //        make.left.equalTo(weakSelf.view.mas_left).offset(20);
    //        make.right.equalTo(weakSelf.view.mas_right).offset(-20);
    //        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-20);
    //
    //    }];
    
    //  第二种方式:链式设置约束
    //    [redView makeConstraints:^(MASConstraintMaker *make) {
    ////        make.top.equalTo(weakSelf.view.top).offset(20);
    //        make.top.left.equalTo(weakSelf.view).offset(20);
    //        make.bottom.right.equalTo(weakSelf.view).offset(-20);
    //    }];
    
    // 第三种方式
    [redView makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 20, 20, 20));
        make.edges.equalTo(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
    
    // makeConstraints 只能用于添加约束
    //   [redView makeConstraints:^(MASConstraintMaker *make) {
    //       make.top.equalTo(weakSelf.view.top).offset(50);
    //   }];
    //  更新已有约束,添加没有约束
    [redView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(50);
    }];
    //  清除之前的约束,重新添加
    //    [redView remakeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(weakSelf.view.top).offset(50);
    //    }];
}

@end
