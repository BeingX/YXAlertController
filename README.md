## Installation
Drag the file:YXAlertController to your project
```objective-c
#import "UIAlertController+YXAdd.h"
```
## Usage
![image](http://a.picphotos.baidu.com/album/s%3D1600%3Bq%3D90/sign=9d7d919f72f08202299295397bcbc09c/5882b2b7d0a20cf4019b8b6377094b36acaf9906.jpg)
```objective-c
UIAlertController *aler2 =  [UIAlertController alertControllerWithTitle:@"确定取消" message:@"确定取消确定取消确定取消" cancelClicked:^{
NSLog(@"取消");
} sureClicked:^{
NSLog(@"确定");
}];
[aler2 show];
```
or even easier:
```objective-c
[[UIAlertController alertControllerWithTitle:@"确定取消" message:@"确定取消确定取消确定取消" cancelClicked:^{
NSLog(@"取消");
} sureClicked:^{
NSLog(@"确定");
}] show];
```