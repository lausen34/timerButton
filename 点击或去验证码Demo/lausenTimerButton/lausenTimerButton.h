//
//  CFTimerButton.h
//  QuanQiuXingJinFu
//
//  Created by 中投全球 on 16/6/29.
//  Copyright © 2016年 Caifu Jutou (Beijing) Information Service Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^timerButtonTask)();

@interface lausenTimerButton : UIButton

+ (instancetype)lau_timerButtonTimeCount:(CGFloat)timeCount normalBackgroudColor:(UIColor *)normalColor selectedBackgroudColor:(UIColor *)selectedColor timeButtonTask:(timerButtonTask)timeButtonTask;

@end
