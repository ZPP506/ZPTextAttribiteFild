//
//  UITextAttribiteNameVrify.m
//  ZJNews
//
//  Created by admin on 2019/12/24.
//  Copyright © 2019 FXEYE. All rights reserved.
//

#import "ZPTextAttribiteNameVrify.h"
#import "ZPTextAttribiteFild.h"

@implementation ZPTextAttribiteNameVrify
/// 校验是否合法
- (BOOL)Verify:(ZPTextAttribiteFild *)fild{
    
    if (fild.text.length <= 0) {
        self.errorMessage = @"名称不能为空";
    }else{
        self.errorMessage = nil;
    }
    if (self.errorMessage.length > 0) {
        return NO;
    }
    return YES;
}
@end
