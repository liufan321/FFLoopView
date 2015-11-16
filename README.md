# FFLoopView

## 功能特点

* 无限循环的图片轮播器
* 支持显示提示标签
* 三种自定义分页控件
* 指定分页控件位置

### 屏幕截图

<img src="https://github.com/liufan321/FFLoopView/blob/master/screenshots/screenshots_1.png?raw=true">
<img src="https://github.com/liufan321/FFLoopView/blob/master/screenshots/screenshots_2.png?raw=true">
<img src="https://github.com/liufan321/FFLoopView/blob/master/screenshots/screenshots_3.png?raw=true">

## 开发环境

* iOS 8.0+
* Xcode 7.0+
* Swift 2.0

## 安装

* 进入终端并且切换到 `xcodeproj` 所在目录
* 输入以下命令，创建 `Podfile`

```bash
$ pod init
```

* 编辑 `Podfile`，并且输入以下内容

```
platform :ios, '8.0'
use_frameworks!

pod 'FFLoopView'
```

## 使用

### Swift

```swift
loopView.showImages(urls, tips: tips) { [weak self] index in
    print("选中了第 \(index) 张图像 \(self?.view)")
}
```

#### 参数说明

1. urls: 轮播器图像的 URL 数组
2. tips: 每张图片对应的提示信息字符串数组，可以为 nil
3. 完成回调：index 选中图像的索引值

#### 注意事项

1. 完成闭包中的 self 需要使用 `[weak self]` 否则会出现循环引用
2. 如果需要释放轮播器视图，需要先调用 `loopView.stopTimer()` 关闭时钟，否则会出现内存泄漏
3. 如果由于设备旋转需要重新更新轮播器布局，可以调用 `loopView.relayoutView()`

### Objective-C

```objc
__weak typeof(self) weakSelf = self;
[self.loopView showImages:urls tips:nil timeInterval:5.0 selectedImage:^(NSInteger index) {
    NSLog(@"选中了第 %zd 张图片 %@", index, weakSelf.view);
}];
```

> 详细信息请参见示例代码
