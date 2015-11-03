//
//  AppDelegate.m
//  StatusBarStyleDemo
//
//  Created by liyan on 15/11/3.
//  Copyright © 2015年 liyan. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate ()

@end

@interface _UINavigationController : UINavigationController

@end


@interface _UITabBarController : UITabBarController

@end

@implementation _UITabBarController



@end

@implementation _UINavigationController


- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}


@end

@interface AVC : UIViewController

@end

@interface BVC : UIViewController

@end

@implementation AVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"A";
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)action
{
    BVC * B = [[BVC alloc]init];
    
    [self.navigationController pushViewController:B animated:YES];
}


@end

@interface BVC()
@property(nonatomic, assign)UIStatusBarStyle style;
@end

@implementation BVC

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"B";

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
}

- (void)action
{
    self.style = UIStatusBarStyleLightContent;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _style;
}

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _UINavigationController * nav = [[_UINavigationController alloc]initWithRootViewController:[[AVC alloc] init]];
    
    _UITabBarController *tabbar = [[_UITabBarController alloc]init];
    
    tabbar.viewControllers = @[nav];
    
    self.window.rootViewController = tabbar;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
