//
//  UIAlertController+block.m
//  test
//
//  Created by 尹啟星 on 16/4/19.
//  Copyright © 2016年 test. All rights reserved.
//

#import "UIAlertController+block.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
@interface UIAlertController () <UITextFieldDelegate>
//@property(nonatomic,strong)UITextField *myTextField;
@end
@implementation UIAlertController (block)
#pragma mark - runTime properity
- (void)setMyTextField:(UITextField *)myTextField{
     objc_setAssociatedObject(self, @selector(myTextField), myTextField, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UITextField *)myTextField{
     return objc_getAssociatedObject(self, @selector(myTextField));
}
- (void)setSureBlock:(sureBlock)sureBlock{
    objc_setAssociatedObject(self, @selector(sureBlock), sureBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)setCancelBlock:(cancelBlock)cancelBlock{
    objc_setAssociatedObject(self, @selector(cancelBlock), cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (sureBlock)sureBlock{
    return objc_getAssociatedObject(self, @selector(sureBlock));
}
- (cancelBlock)cancelBlock{
    return objc_getAssociatedObject(self, @selector(cancelBlock));
}
- (void)setCompletedInputBlock:(completedInputBlock)completedInputBlock{
    objc_setAssociatedObject(self, @selector(completedInputBlock), completedInputBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (completedInputBlock)completedInputBlock{
    return objc_getAssociatedObject(self, @selector(completedInputBlock));
}
#pragma mark - convenient class method
+ (UIAlertController *)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelClicked:(cancelBlock)cancelBlock sureClicked:(sureBlock)sureBlock
{
    UIAlertController *alertVc = [[self class] alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    alertVc.sureBlock = sureBlock;
    alertVc.cancelBlock = cancelBlock;
    [alertVc addSureAction];
    [alertVc addCancelAction];
    return alertVc;
    
}
+ (nullable UIAlertController *)alertControllerWithMessage:(nullable NSString *)message cancelClicked:(nullable cancelBlock)cancelBlock sureClicked:(nullable sureBlock)sureBlock{
    return [[self class] alertControllerWithTitle:nil message:message cancelClicked:cancelBlock sureClicked:sureBlock];
}

+ (UIAlertController *)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message sureClicked:(nullable sureBlock)sureBlock{
    UIAlertController *alertVc = [[self class] alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    alertVc.sureBlock = sureBlock;
    [alertVc addSureAction];
    return alertVc;
}
+ (nullable UIAlertController *)alertControllerWithMessage:(nullable NSString *)message sureClicked:(nullable sureBlock)sureBlock{
   return  [[self class] alertControllerWithTitle:nil message:message sureClicked:sureBlock];
}

+ (UIAlertController *)alertControllerWithTitle:(NSString *)title message:(NSString *)message cancelClicked:(cancelBlock)cancelBlock completedInput:(completedInputBlock)completedInputBlock{
    UIAlertController *alertVc = [[self class] alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    alertVc.cancelBlock = cancelBlock;
     alertVc.completedInputBlock = completedInputBlock;
    [alertVc addSureAction];
    [alertVc addCancelAction];
    __weak typeof(alertVc) weakAlertVc = alertVc;
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        weakAlertVc.myTextField = textField;

    }];
    return alertVc;
}
+ (nullable UIAlertController *)alertControllerWithMessage:(nullable NSString *)message cancelClicked:(nullable cancelBlock)cancelBlock completedInput:(nullable completedInputBlock)completedInputBlock{
   return [[self class] alertControllerWithTitle:nil message:message cancelClicked:cancelBlock completedInput:completedInputBlock];
}
#pragma mark - other workers
- (void)addSureAction{
    __weak typeof(self) weakSelf = self;
    UIAlertAction *actionSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (weakSelf.sureBlock) {
            weakSelf.sureBlock();
        }
        if (weakSelf.myTextField && weakSelf.completedInputBlock) {
            weakSelf.completedInputBlock(weakSelf.myTextField);
        }
        if (weakSelf) {
            [weakSelf dismissViewControllerAnimated:NO completion:nil];
        }
        
        
    }];
    [self addAction:actionSure];
    
}
- (void)addCancelAction{
    __weak typeof(self) weakSelf = self;
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        if (weakSelf.cancelBlock) {
            weakSelf.cancelBlock();
        }
       
        if (weakSelf) {
            
            [weakSelf dismissViewControllerAnimated:NO completion:nil];
        }
        
    }];
    
    
    [self addAction:actionCancel];
    
    
}
- (void)show{
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self animated:YES completion:nil];
}
#pragma mark - memonry managed
- (void)dealloc{
    
}

@end
