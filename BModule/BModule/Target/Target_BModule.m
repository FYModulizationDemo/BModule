//
//  Target_BModule.m
//  BModule
//
//  Created by 杨飞宇 on 2017/7/3.
//  Copyright © 2017年 FY. All rights reserved.
//

#import "Target_BModule.h"
#import "BModuleViewController.h"

@implementation Target_BModule

- (UIViewController *)Action_viewController:(NSDictionary *)params {
    return [[BModuleViewController alloc] init];
}

- (void)Action_showLog:(NSDictionary *)params {
    NSString *message = params[@"message"];
    
    NSLog(@"show log:%@", message);
}

- (UIAlertController *)Action_showAlert:(NSDictionary *)params {
    NSString *title = params[@"title"];
    NSString *message = params[@"message"];
    BModuleBlock confirmBlock = params[@"confirmBlock"];
    BModuleBlock cancelBlock = params[@"cancelBlock"];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    
    [alertController addAction:confirm];
    [alertController addAction:cancel];
    
    return alertController;
}

@end
