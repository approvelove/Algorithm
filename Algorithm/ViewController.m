//
//  ViewController.m
//  Algorithm
//
//  Created by lijian on 15/6/2.
//  Copyright (c) 2015年 lijian. All rights reserved.
//

#import "ViewController.h"

#import "SubViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //测试快速排序
    NSMutableArray *mutAry = [@[@30,@20,@40,@10,@35] mutableCopy];
    [self quickSort:mutAry leftLocation:0 rightLocation:(int)(mutAry.count -1)];
    NSLog(@"mutary = %@", mutAry);
    
    ///////
    SubViewController *testSub = [[SubViewController alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/////快速排序的OC实践
- (void)quickSort:(NSMutableArray *)ary leftLocation:(int)leftV rightLocation:(int)rightV
{
    NSAssert(ary && ary.count - 2>0, @"该数组不能为空,且至少有两个数在数组中。");
    //快速排序
    //选取一个数作为基准数字
    int left_loc =leftV;
    int right_loc = rightV;
    if (left_loc < right_loc) {
        int baseValue = [ary[left_loc] intValue];
        while (left_loc < right_loc) {
            //从右向左找小于baseValue的数来填ary[left_loc]
            while ((left_loc < right_loc)&&([ary[right_loc] intValue]>=baseValue)) {
                right_loc--;
            }
            if (left_loc < right_loc) {
                [ary replaceObjectAtIndex:left_loc withObject:ary[right_loc]];
            }
            
            //从左向右找大于或等于baseValue的数来填充ary[right_loc];
            while ((left_loc < right_loc)&&([ary[left_loc] intValue] < baseValue)) {
                left_loc++;
            }
            if (left_loc < right_loc) {
                [ary replaceObjectAtIndex:right_loc withObject:ary[left_loc]];
                right_loc--;
            }
        }
        [ary replaceObjectAtIndex:right_loc withObject:@(baseValue)];
        [self quickSort:ary leftLocation:leftV rightLocation:right_loc-1]; //左边部分
        [self quickSort:ary leftLocation:right_loc+1 rightLocation:rightV];
    }
}


////合并排序的OC实践
- (void)mergeSort:(NSMutableArray *)ary
{
    
}
@end
