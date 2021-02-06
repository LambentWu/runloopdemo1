//
//  ViewController.m
//  runloopdemo
//
//  Created by Lambent on 2021/1/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //时钟事件
    //创建一个timer 不用加进runloop是默认已经加入runloop默认模式了
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    //
//  runloop例子
    NSTimer *timer= [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    //将timer添加在runloop上去
//    //将下面两句添加上去（runloop处理触摸 时钟 网络事件  是一个运行循环，负责监听事件） 才可以既拖拽又执行test方法，否则如果只是用UI模式（手放上去时钟才会开始，否则不会），那么手离开之后，时钟也会停止。因为runloop此时回去睡觉了，不会再执行时钟，加上默认模式，手离开了也可以继续时钟
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
   //下面这句既处理触摸事件 又能同时执行时钟
   // [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //  记住runloop是会休眠的，也就是没事干（处理完任务）就会去睡觉
   /* //runloop有五种模式
    NSDefaultRunLoopMode  默认模式
    UITrackingRunLoopMode  UI模式
    NSRunLoopCommonModes    占位模式（并不是真正的runloop真正的模式）
    */
}
// 结合storyboard理解结合storyboard理解结合storyboard理解结合storyboard理解结合storyboard理解结合storyboard理解结合storyboard理解结合storyboard理解结合storyboard理解结合storyboard理解
//timer中不建议处理耗时的操作一旦有耗时操作  在子线程做
-(void)test{
//    谁一秒 阻塞线程
   // [NSThread sleepForTimeInterval:1.0 ];
    
    static int num;
    NSLog(@"%d",num++);
    
    
}

@end
