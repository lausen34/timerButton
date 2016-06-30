//
//  CFTimerButton.m
//  Lausen
//
//  Created by 刘翔 on 16/6/29.
//  Copyright © 2016年 Caifu Jutou (Beijing) Information Service Co., Ltd. All rights reserved.
//

#import "lausenTimerButton.h"


@interface lausenTimerButton ()

@property (nonatomic , copy) timerButtonTask timeButtonTask;

@property (nonatomic , assign) NSInteger timeCount;

@property (nonatomic , strong) UIColor *normalColor;

@property (nonatomic , strong) UIColor *selectedColor;

@end

@implementation lausenTimerButton

+ (instancetype)lau_timerButtonTimeCount:(CGFloat)timeCount normalBackgroudColor:(UIColor *)normalColor selectedBackgroudColor:(UIColor *)selectedColor timeButtonTask:(timerButtonTask)timeButtonTask{
    
    lausenTimerButton *timer = [[lausenTimerButton alloc]init];
    
    timer.timeCount = timeCount;
    
    timer.timeButtonTask = timeButtonTask;
    
    [timer addTarget:self action:@selector(timeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    timer.normalColor = normalColor;
    
    timer.selectedColor = selectedColor;
    
    timer.backgroundColor = normalColor;
    
    return timer;
}


+ (void)timeButtonClick:(lausenTimerButton *)sender{
    
    sender.timeButtonTask();
    
    __block NSInteger timeCount = sender.timeCount;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if (timeCount <= 0) {
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [sender setTitle:@"点击重新获取" forState:UIControlStateNormal];
                
                sender.backgroundColor = sender.normalColor;
                
                sender.enabled = YES;
            });
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                sender.backgroundColor = sender.selectedColor;
                
                [sender setTitle:[NSString stringWithFormat:@"%zd秒后可重新获取",timeCount] forState:UIControlStateNormal];
                
                sender.enabled = NO;
            });
        }
        timeCount--;
    });
    dispatch_resume(_timer);

}

@end
