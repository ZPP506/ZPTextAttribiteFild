
## Example


![骑上蜗牛去看大海 2020-07-07 18.04.21.gif](https://upload-images.jianshu.io/upload_images/11285123-fbde0fbf66af04e9.gif?imageMogr2/auto-orient/strip)


## ZPTextAttribiteBaseVrify 
校验输入框内容基类

## ZPTextAttribiteFild：
```
/// placeHold 和 输入框的间距
@property (nonatomic, assign) CGFloat placeHoldSpaceFild;
/// 输入框距离底部的间距
@property (nonatomic, assign) CGFloat fildSpaceBottom;
/// 占位文字颜色
@property (nonatomic, strong) UIColor *placeholderTextColor;
/// 底部线的颜色
@property (nonatomic, strong) UIColor *lineColor;
/// 底部线选中后的颜色
@property (nonatomic, strong) UIColor *lineSelecateColor;
/// 占位文字大小
@property (nonatomic, strong) UIFont *placeholderFont;
/// 验证输入合法性
@property (nonatomic, strong) ZPTextAttribiteBaseVrify * verify;

```
## 装饰模式 + 策略模式的一种应用
![placeHoldSpaceFild.png](https://upload-images.jianshu.io/upload_images/11285123-6f14d4d74f37d316.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## Installation

ZPTextAttribiteFild is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZPTextAttribiteFild', '~> 1.0.3'
```

## Author

ZPP506, 944160330@qq.com

## License

ZPTextAttribiteFild is available under the MIT license. See the LICENSE file for more info.
