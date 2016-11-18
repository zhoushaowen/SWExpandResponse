//
//  UIView+ExpandResponse.m
//  ExpandResponse
//
//  Created by 周少文 on 2016/11/18.
//  Copyright © 2016年 Yidu. All rights reserved.
//

#import "UIView+ExpandResponse.h"
#import <objc/runtime.h>

static void *noneExpandResponseKey = &noneExpandResponseKey;

@implementation UIView (ExpandResponse)

+ (void)load
{
    Method method1 = class_getInstanceMethod([self class], @selector(pointInside:withEvent:));
    Method method2 = class_getInstanceMethod([self class], @selector(sw_pointInside:withEvent:));
    method_exchangeImplementations(method1, method2);
}

- (BOOL)sw_pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if(!self.noneExpandResponse)
    {
        CGRect bounds = self.bounds;
        CGFloat dx = MIN(bounds.size.width - 44.0f, 0)/2.0f;
        CGFloat dy = MIN(bounds.size.height - 44.0f, 0)/2.0f;
        bounds = CGRectInset(bounds, dx, dy);
        return CGRectContainsPoint(bounds, point);
    }else{
        return [self sw_pointInside:point withEvent:event];
    }
}

- (void)setNoneExpandResponse:(BOOL)noneExpandResponse
{
    objc_setAssociatedObject(self, noneExpandResponseKey, @(noneExpandResponse), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)noneExpandResponse
{
    return [objc_getAssociatedObject(self, noneExpandResponseKey) boolValue];
}


@end