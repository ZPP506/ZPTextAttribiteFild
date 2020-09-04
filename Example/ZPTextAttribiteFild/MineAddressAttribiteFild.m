//
//  MineAddressAttribiteFild.m
//  ZJNews
//
//  Created by admin on 2019/12/23.
//  Copyright © 2019 FXEYE. All rights reserved.
//

#import "MineAddressAttribiteFild.h"

@implementation MineAddressAttribiteFild

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.placeholderTextColor = [UIColor grayColor];
        self.placeholderFont = [UIFont systemFontOfSize:15];
        self.textColor = [UIColor blackColor];
        self.font = [UIFont systemFontOfSize:15];
        self.placeHoldSpaceFild = 6;
        self.fildSpaceBottom = 12;
        self.lineColor = [UIColor grayColor];
        self.lineSelecateColor = [UIColor redColor];
//        self.secureTextEntry = true
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeholderTextColor = [UIColor grayColor];
        self.placeholderFont = [UIFont systemFontOfSize:15];
        self.textColor = [UIColor blackColor];
        self.font = [UIFont systemFontOfSize:15];
        self.placeHoldSpaceFild = 6;
        self.fildSpaceBottom = 12;
        self.lineColor = [UIColor grayColor];
       self.lineSelecateColor = [UIColor redColor];
    }
    return self;
}
@end
