//
//  ViewController1.m
//  runloopdemo
//
//  Created by Lambent on 2021/1/30.
//

#import "ViewController1.h"
#import "HkThead.h"

@interface ViewController1 ()
@property(nonatomic,assign)BOOL finsh;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _finsh = NO;
    // 多线程配合runloop多线程配合runloop多线程配合runloop多线程配合runloop多线程配合runloop多线程配合runloop,每条线程上面都有一个runloop
    //每条线程上面都有一个runloop 默认都不开启循环（主线程默认开启）
    HkThead *thread =[[HkThead alloc]initWithBlock:^{
       
        // Do any additional setup after loading the view.
        NSTimer *timer= [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
        /* //runloop有五种模式
         NSDefaultRunLoopMode  默认模式  处理timer或者网络事件
         UITrackingRunLoopMode  UI模式   专门处理ui事件
         NSRunLoopCommonModes    占位模式（UI&&默认 并不是真正的runloop真正的模式）
         */
        //这里不用占位模式了，因为这里是子线程，即使用默认模式，有触摸事件的时候（触摸事件在主线程），也不会停止时钟
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//        保住线程生命 开启runloop循环，默认不开启，开启之后在这段代码之前一直循环，不会走下面一句(nslog来了%@这句)（死循环）
      //  [[NSRunLoop currentRunLoop] run]; //死循环,一直跑 会cpu冒烟的，用 until这句
        //runloop保证线程不退出，因为在thread子线程里面不加runloop情况下 代码执行完 就释放了，run了runloop后。线程就能存在，这也是为什么加了run之后，hkthread不会马上释放
        while (!_finsh) {
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.00001]];
        }
        
        
        
        NSLog(@"来了%@",[NSThread currentThread]);
    }];
    // start
    [thread start];
    
   
}
-(void)test{
//    谁一秒 阻塞线程
   // [NSThread sleepForTimeInterval:1.0 ];
    
    static int num;
    NSLog(@"%d",num++);
   // NSLog(@"%@",[NSThread currentThread]);
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    _finsh=YES;
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
