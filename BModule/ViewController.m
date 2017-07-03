//
//  ViewController.m
//  BModule
//
//  Created by 杨飞宇 on 2017/7/3.
//  Copyright © 2017年 FY. All rights reserved.
//

#import "ViewController.h"
#import "Target_BModule.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) Target_BModule *targetB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.count = 1;
    
    Target_BModule *targetB = [[Target_BModule alloc] init];
    self.targetB = targetB;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    if (self.count == 1) {
        self.count ++;
        
        NSMutableDictionary *params = [@{} mutableCopy];
        params[@"message"] = @"hello yangfeiyu";
        [self.targetB Action_showLog:params];
        
    } else if (self.count == 2) {
        self.count ++;
        
        NSMutableDictionary *params = [@{} mutableCopy];
        params[@"title"] = @"hello";
        params[@"message"] = @"yangfeiyu";
        params[@"confirmBlock"] = ^{
            NSLog(@"confirmBlock");
        };
        params[@"cancelBlock"] = ^{
            NSLog(@"cancelBlock");
        };
        UIAlertController *alert = [self.targetB Action_showAlert:params];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        self.count = 1;
        UIViewController *vc = [self.targetB Action_viewController:nil];;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}


@end
