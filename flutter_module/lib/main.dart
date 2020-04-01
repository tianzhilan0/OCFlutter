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
