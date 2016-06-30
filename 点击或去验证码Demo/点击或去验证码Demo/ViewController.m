//
//  ViewController.m
//  点击或去验证码Demo
//
//  Created by 刘翔 on 16/6/30.
//  Copyright © 2016年 Caifu Jutou (Beijing) Information Service Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "lausenTimerButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    lausenTimerButton *timerButton = [lausenTimerButton lau_timerButtonTimeCount:60 normalBackgroudColor:[UIColor redColor] selectedBackgroudColor:[UIColor grayColor] timeButtonTask:^{
        
       //这儿是用来调用发送短信验证码的接口
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"短息验证码已发送" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alertView show];
        
    }];
    
    timerButton.frame = CGRectMake(50, 50, 180, 40);
    
    timerButton.layer.cornerRadius = 5;
    timerButton.layer.masksToBounds = YES;
    
    [timerButton setTitle:@"点击获取验证码" forState:UIControlStateNormal];
    
    [self.view addSubview:timerButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
