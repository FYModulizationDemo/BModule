//
//  Target_BModule.h
//  BModule
//
//  Created by 杨飞宇 on 2017/7/3.
//  Copyright © 2017年 FY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BModuleBlock)(void);

@interface Target_BModule : NSObject

- (UIViewController *)Action_viewController:(NSDictionary *)params;

- (void)Action_showLog:(NSDictionary *)params;

- (UIAlertController *)Action_showAlert:(NSDictionary *)params;

@end
