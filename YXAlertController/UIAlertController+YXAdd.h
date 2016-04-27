//
//  UIAlertController+YXAdd.h
//  test
//
//  Created by 尹啟星 on 16/4/19.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^callBackBlock)();
typedef callBackBlock cancelBlock;
typedef callBackBlock sureBlock;
typedef void(^completedInputBlock)( UITextField * _Nullable textField);
@interface UIAlertController (YXAdd)

@property (nonatomic,strong)        UITextField * _Nullable myTextField;
/**
 *  只有 确定、取消的alertView,返回的实例对象必须调用show方法来弹出alert
 *
 *  @param title       标题
 *  @param message     弹出的详细信息
 *  @param cancelBlock 当点击取消时，会回调这个block
 *  @param sureBlock   当点击确定时，会回调这个block
 *
 *  @return UIAlertController的实例
 */
+ (nullable UIAlertController *)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelClicked:(nullable cancelBlock)cancelBlock sureClicked:(nullable sureBlock)sureBlock;
/**
 *  只有 确定、取消的alertView,返回的实例对象必须调用show方法来弹出alert
 *
 *  @param message     信息
 *  @param cancelBlock 当点击取消时，会回调这个block
 *  @param sureBlock   当点击确定时，会回调这个block
 *
 *  @return UIAlertController的实例
 */
+ (nullable UIAlertController *)alertControllerWithMessage:(nullable NSString *)message cancelClicked:(nullable cancelBlock)cancelBlock sureClicked:(nullable sureBlock)sureBlock;
/**
 *  只有 确定的alertView,返回的实例对象必须调用show方法来弹出alert
 *
 *  @param title     标题
 *  @param message   弹出的详细信息
 *  @param sureBlock 当点击确定时，会回调这个block
 *
 *  @return UIAlertController的实例
 */
+ (nullable UIAlertController *)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message sureClicked:(nullable sureBlock)sureBlock;
/**
 *  只有 确定的alertView,返回的实例对象必须调用show方法来弹出alert
 *
 *  @param message   弹出的详细信息
 *  @param sureBlock 当点击确定时，会回调这个block
 *
 *  @return UIAlertController的实例
 */
+ (nullable UIAlertController *)alertControllerWithMessage:(nullable NSString *)message sureClicked:(nullable sureBlock)sureBlock;
/**
 *  init一个带输入框、确定、取消的alert
 *
 *  @param title               标题
 *  @param message             弹出的详细信息
 *  @param cancelBlock         当点击取消时，会回调这个block
 *  @param completedInputBlock 当点击确定完成输入时，会回调这个block
 *
 *  @return UIAlertController的实例
 */
+ (nullable UIAlertController *)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelClicked:(nullable cancelBlock)cancelBlock completedInput:(nullable completedInputBlock)completedInputBlock;
/**
 *  init一个带输入框、确定、取消的alert
 *
 *  @param message             弹出的详细信息
 *  @param cancelBlock         当点击取消时，会回调这个block
 *  @param completedInputBlock 当点击确定完成输入时，会回调这个block
 *
 *  @return UIAlertController的实例
 */
+ (nullable UIAlertController *)alertControllerWithMessage:(nullable NSString *)message cancelClicked:(nullable cancelBlock)cancelBlock completedInput:(nullable completedInputBlock)completedInputBlock;
/**
 *  弹出alertView
 */
- (void)show;
@end
