//
//  ViewController3.m
//  runloopdemo
//
//  Created by Lambent on 2021/1/30.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    //  Do any additional setup after loading the view.
    //  结合加载高清大图demo看
    // 当滑动很快，此时runloop除了处理触摸事件，还得处理高清大图，因为那个项目是进入返回cell里面，移除子控件再重新添加，然后添加三张图片，高清和移除重新添加都是耗时操作，此时runloop(在主线程场景)在触摸和显示 这里就会显得非常卡顿，
    //  所以引进了runloop监控
    
    
    //  （对于此加载大图应用场景）runloop 如果没有任务处理，会进入休眠状态，如果要让runloop一直运行，监控runloop，那就搞一个时钟，每隔极短的时间的执行某个方法，这样就能让监控的runloop的运行
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
