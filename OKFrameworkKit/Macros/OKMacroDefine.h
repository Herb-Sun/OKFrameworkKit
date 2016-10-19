//
//  OKMacroDefine.h
//  Copyright © 2016年 OKInc. All rights reserved.
//
//  常用宏定义
#ifndef OKMacroDefine_h
#define OKMacroDefine_h

// OKLog日志输出(Debug调试时输出）
#ifdef DEBUG
#define OKLogV() __OKLOG(@"OKLog-> %s::%s::Line(%d)\n", __FILE__, __FUNCTION__, __LINE__)
#define OKLog(id, ...) __OKLOG(@"OKLog-> %s::%s::Line:(%d):%@ \n", __FILE__, __FUNCTION__, \
__LINE__, [NSString stringWithFormat:(id), ##__VA_ARGS__])
#else
#define OKLogV() do{} while(0)
#define OKLog(...) do{} while(0)
#endif
#define __OKLOG(s, ...) NSLog(@"%@",[NSString stringWithFormat:(s), ##__VA_ARGS__])

#define OKNotificationCenter [NSNotificationCenter defaultCenter]
#define OKUserDefaults       [NSUserDefaults standardUserDefaults]
#define OKLocalString(key, content) NSLocalizedString(key, content)

#define OKKEY_WINDOW [UIApplication sharedApplication].keyWindow
#define OKTICK NSDate *startTime = [NSDate date];
#define OKTOCK NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);

/** 系统版本 >=6.0*/
#define IOS6_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")
#define IOS7_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define IOS8_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
#define IOS9_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")
#define IOS10_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] \
compare:v options:NSNumericSearch] != NSOrderedAscending)

#define DeviceModel        [[UIDevice currentDevice] model]
#define DeviceVersion      [[UIDevice currentDevice] systemVersion]
#define DeviceVersionCode  [[[UIDevice currentDevice] systemVersion] floatValue]
#define DeviceSystemName   [[UIDevice currentDevice] systemName]
#define DeviceLang         [[NSLocale preferredLanguages] objectAtIndex:0]
#define DeviceLocal        [[NSLocale currentLocale] localeIdentifier]

/** 获取APP名称 */
#define APP_NAME ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])
/** 程序版本号 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** 获取APP build版本 */
#define APP_BUILD ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])
/** User-Agent */
#define APP_USER_AGENT [NSString stringWithFormat:@"OKCoin/%@ (%@;U;%@ %@;%@/%@)", \
    APP_VERSION, DeviceModel, DeviceSystemName, DeviceVersion, DeviceLocal, DeviceLang]

/** 屏幕宽 */
#define OK_SCREEN_WIDTH    ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || \
([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? \
[[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
/** 屏幕高 */
#define OK_SCREEN_HEIGHT   ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || \
([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? \
[[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

// 加载图片
#define OKLOAD_IMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]
#define OKLOAD_DEFAULT_IMAGE(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]]

/** Float: Degrees -> Radian **/
#define OK_DEGREES_TO_RADIANS(degrees) ((M_PI * degrees) / 180.0)

/** Float: Radians -> Degrees **/
#define OK_RADIANS_TO_DEGREES(radians) ((radians * 180.0)/ M_PI)

// *************** 颜色 ***************
#define OKColorWithRGB(r, g, b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]
#define OKColorWithRGBA(r, g, b, a)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
#define OKColorWithWhite(w, a)      [UIColor colorWithWhite:(w/255.0) alpha:a]
#define OKColorHex(hexValue)        [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:1.0]
#define OKColorHexA(hexValue, a)    [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:(a)]

/////////////尺寸////////////////////////
#define OKSTATUSBAR_HEIGHT 20.0
#define OKNAVIGATIONBAR_HEIGHT 44.0
#define OKSTATUSANDNAVBAR_HEIGHT 64.0
#define OKTABBAR_HEIGHT 49.0


/// 安全执行block
#define OKBLOCK_SAFE_EXEC(block, ...) if(block){block(__VA_ARGS__);}
#define OKFormatString(str,...) [NSString stringWithFormat:str, ##__VA_ARGS__]

////////////////////////////////////////////////////////////////////////////////////////////////////
// 单例实现和定义宏
#define OKSingleInstance_H_(name) \
+ (instancetype)shared##name;

#define OKSingleInstance_M_(name) \
static id _instance = nil; \
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
if (_instance == nil) \
{ \
_instance = [[self alloc] init]; \
} \
}); \
return _instance; \
} \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
if (_instance == nil) \
{ \
_instance = [super allocWithZone:zone]; \
} \
}); \
return _instance; \
} \
\
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
} \
+ (id)mutableCopyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
}

#endif /* OKMacroDefine_h */
