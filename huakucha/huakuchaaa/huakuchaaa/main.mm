//
//  main.c
//  WeChatPlugin
//
//  Created by TK on 2017/4/19.
//  Copyright © 2017年 tk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static void __attribute__((constructor)) initialize(void) {

    Class Aclass = objc_getClass("Activation");
    SEL selector = NSSelectorFromString(@"checkIfIsActivated");
    Method method = class_getInstanceMethod(Aclass, selector);
    IMP imp = imp_implementationWithBlock(^(id self) {
        return YES;
    });
    
    class_replaceMethod(Aclass, selector, imp, method_getTypeEncoding(method));
    {
        Class Dclass = objc_getClass("DM_SUUpdater");
        SEL selector = NSSelectorFromString(@"checkIfConfiguredProperly");
        Method method = class_getInstanceMethod(Dclass, selector);
        IMP imp = imp_implementationWithBlock(^(id self) {
            return;
        });
        class_replaceMethod(Dclass, selector, imp, method_getTypeEncoding(method));
    }
    //-[DM_SUUpdater checkIfConfiguredProperly]:
}
