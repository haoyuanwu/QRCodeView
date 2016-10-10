//
//  AppDelegate.h
//  HYQRCodeView
//
//  Created by wuhaoyuan on 2016/10/10.
//  Copyright © 2016年 HYQRCodeView. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

