//
//  ZPTextAttribiteBaseVrify.h
//  ZJNews
//
//  Created by admin on 2019/12/20.
//  Copyright © 2019 FXEYE. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZPTextAttribiteFild;
@interface ZPTextAttribiteBaseVrify : NSObject

/// 校验是否合法
- (BOOL)Verify:(ZPTextAttribiteFild *)fild;

/// 不合法 错误信息
@property (nonatomic, strong) NSString *errorMessage;
@end

