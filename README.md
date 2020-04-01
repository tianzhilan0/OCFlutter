# OCFlutter

#### 最终效果图如下
![m0007-1fvip.gif](https://upload-images.jianshu.io/upload_images/1243891-492aad69f4163659.gif?imageMogr2/auto-orient/strip) 

### 1、创建OC项目
![image.png](https://upload-images.jianshu.io/upload_images/1243891-0ba37cfdaa88c588.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/1243891-31c5f9faaf2e35d0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 2、添加cocoapods
```
cd /Users/lc/Desktop/Test/OCFlutter 
pod init
pod install
```
![image.png](https://upload-images.jianshu.io/upload_images/1243891-88c5f3c3ad440ec7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 3、创建Flutter 工程
#### 在OCFlutter项目的相同路径上创建module
```
cd /Users/lc/Desktop/Test
flutter create -t module flutter_module
```
![image.png](https://upload-images.jianshu.io/upload_images/1243891-b3911d4e9e9ed6a8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 4、在OCFlutter项目新建Config目录，在这个目录下新建3个配置文件
- #### Flutter.xccofig，内容如下：
```
#include "../flutter_module/.ios/Flutter/Generated.xcconfig"
ENABLE_BITCODE=NO
```

- #### Debug.xccofig，内容如下：
```
#include "Flutter.xcconfig"
#include "Pods/Target Support Files/Pods-iOS项目名称/Pods-iOS项目名称.debug.xcconfig"
```
- #### Release.xccofig，内容如下：
```
#include "Flutter.xcconfig"
#include "Pods/Target Support Files/Pods-iOS项目名称/Pods-iOS项目名称.debug.xcconfig"
FLUTTER_BUILD_MODE=release
```
![image.png](https://upload-images.jianshu.io/upload_images/1243891-b59a1b2238c8436d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/1243891-00786fc1bd092deb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/1243891-a8619e5564785b25.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/1243891-15ab89e8cc3a1687.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 5、修改OCFlutter配置
- #### 关闭Bitcode
![image.png](https://upload-images.jianshu.io/upload_images/1243891-068fb3c74a249372.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- #### 修改运行环境
![image.png](https://upload-images.jianshu.io/upload_images/1243891-bd24e1405a4360ef.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- #### 添加Run Script
```
"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" build
"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" embed
```
![image.png](https://upload-images.jianshu.io/upload_images/1243891-8c6e16de6c6a068f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/1243891-41c3f496d0edf0b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- ####  修改Podfile内容，添加如下内容，添加完成之后再执行一次`pod install`
```
flutter_application_path = '../flutter_module'
eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)
```
![image.png](https://upload-images.jianshu.io/upload_images/1243891-98a9a51b2f1bf252.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/1243891-375a54947c998db6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 6、运行一下flutter_module，生成一些文件，运行成功之后，关闭就行
![image.png](https://upload-images.jianshu.io/upload_images/1243891-a6f6cd340b647bb1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### 7、在OCFlutter项目下添加`Flutter`目录
- #### `command+shift+。`显示隐藏文件
![image.png](https://upload-images.jianshu.io/upload_images/1243891-795d5abf7741d633.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- #### 在Flutter文件下添加`flutter_assets`
将此处的`flutter_assets`拷贝至`Flutter`目录下，导入到项目
![image.png](https://upload-images.jianshu.io/upload_images/1243891-5c2a329adcea0020.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/1243891-b6d4ba097f8644ea.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- #### 在Flutter文件下添加`App.framework`
将此处的`App.framework`拷贝至`Flutter`目录下，导入到项目
![image.png](https://upload-images.jianshu.io/upload_images/1243891-6b385bf7b5deb8f4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/1243891-b1be385269ded69e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- #### 在Flutter文件下添加`engine`
将此处的`engine`拷贝至`Flutter`目录下，导入到项目
![image.png](https://upload-images.jianshu.io/upload_images/1243891-a4f1841dd0b654a0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/1243891-b1be385269ded69e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- #### 最终显示如下样式
![image.png](https://upload-images.jianshu.io/upload_images/1243891-11dc82d600c73290.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 在此处编译一下OCFlutter项目，如不报错，则已准备完成，接下来就是撸代码了。

### 8、撸代码
- #### 修改`AppDelegate.h`代码
```
#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>


@interface AppDelegate : FlutterAppDelegate <UIApplicationDelegate, FlutterAppLifeCycleProvider>

@property (strong, nonatomic) UIWindow *window;


@end
```
- #### 修改`AppDelegate.m`代码
```

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    FlutterPluginAppLifeCycleDelegate *_lifeCycleDelegate;
}

- (instancetype)init {
    if (self = [super init]) {
        _lifeCycleDelegate = [[FlutterPluginAppLifeCycleDelegate alloc] init];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return [_lifeCycleDelegate application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)application:(UIApplication*)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings*)notificationSettings {
    [_lifeCycleDelegate application:application
didRegisterUserNotificationSettings:notificationSettings];
}

- (void)application:(UIApplication*)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    [_lifeCycleDelegate application:application
didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication*)application
didReceiveRemoteNotification:(NSDictionary*)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [_lifeCycleDelegate application:application
       didReceiveRemoteNotification:userInfo
             fetchCompletionHandler:completionHandler];
}

- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id>*)options {
    return [_lifeCycleDelegate application:application openURL:url options:options];
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url {
    return [_lifeCycleDelegate application:application handleOpenURL:url];
}

- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
  sourceApplication:(NSString*)sourceApplication
         annotation:(id)annotation {
    return [_lifeCycleDelegate application:application
                                   openURL:url
                         sourceApplication:sourceApplication
                                annotation:annotation];
}

- (void)application:(UIApplication*)application
performActionForShortcutItem:(UIApplicationShortcutItem*)shortcutItem
  completionHandler:(void (^)(BOOL succeeded))completionHandler NS_AVAILABLE_IOS(9_0) {
    [_lifeCycleDelegate application:application
       performActionForShortcutItem:shortcutItem
                  completionHandler:completionHandler];
}

- (void)application:(UIApplication*)application
handleEventsForBackgroundURLSession:(nonnull NSString*)identifier
  completionHandler:(nonnull void (^)(void))completionHandler {
    [_lifeCycleDelegate application:application
handleEventsForBackgroundURLSession:identifier
                  completionHandler:completionHandler];
}

- (void)application:(UIApplication*)application
performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [_lifeCycleDelegate application:application performFetchWithCompletionHandler:completionHandler];
}

- (void)addApplicationLifeCycleDelegate:(NSObject<FlutterPlugin>*)delegate {
    [_lifeCycleDelegate addDelegate:delegate];
}

#pragma mark - UISceneSession lifecycle
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

@end

```
- #### `ViewController.m`中代码如下
```

#import "ViewController.h"
#import <Flutter/FlutterViewController.h>
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)jumpToFlutter:(id)sender {
    FlutterViewController* flutterViewController = [[FlutterViewController alloc]init];
    [flutterViewController setInitialRoute:@"pag1"];
    
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"com.pages.your/native_get" binaryMessenger:(NSObject<FlutterBinaryMessenger> *)flutterViewController];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSString *method = [call method];
        if ([method isEqualToString:@"FlutterPopIOS"]) {
            NSLog(@"FlutterPopIOS：获取Flutter返回时传的值 == %@",[call arguments]);
            [self.navigationController popViewControllerAnimated:true];
        }
        if ([method isEqualToString:@"FlutterCickedActionPushIOSNewVC"]) {
            NSLog(@"FlutterCickedActionPushIOSNewVC：返回来传的参数是 == %@",[call arguments]);
            LoginViewController *loginCV = [[LoginViewController alloc] init];
            [self.navigationController pushViewController:loginCV animated:true];
        }
        if ([method isEqualToString:@"FlutterGetIOSArguments"]) {
            NSDictionary *dic = @{@"name":@"名字"};
            result(dic);
        }
        
    }];
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

@end

```

- #### `flutter_module`中`main.dart`代码如下
```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.pages.your/native_get');

  String _textString = "null";

  void _backAction() {
    _iOSPushToVC();
  }

  _iOSPushToVC() async {
    await methodChannel.invokeMethod('FlutterPopIOS', '我是返回数据');
  }

  void _pushIOSNewVC() async {
    Map<String, dynamic> map = {
      "code": "200",
      "data": [1, 2, 3]
    };

    await methodChannel.invokeMethod('FlutterCickedActionPushIOSNewVC', map);
  }

  // 给客户端发送一些东东 , 并且拿到一些东东
  Future<Null> _flutterGetIOSArguments(para) async {
    dynamic result;
    try {
      result = await methodChannel.invokeMethod('FlutterGetIOSArguments', para);
      _textString = result["name"];
    } on PlatformException {
      result = 100000;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _backAction,
              child: Text("返回原生"),
            ),
            RaisedButton(
              onPressed: _pushIOSNewVC,
              child: Text("跳转进入一个新的原生页面"),
            ),
            RaisedButton(
              onPressed: () {
                _flutterGetIOSArguments("flutter传值");
              },
              child: Text("从原生页面获取数据"),
            ),
            Text("从原生获取的内容：$_textString"),
          ],
        ),
      ),
    );
  }
}

```




