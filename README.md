## Installation
Drag the file:YXAlertController to your project
```objective-c
#import "UIAlertController+YXAdd.h"
```
## Usage

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
