//
//  UITextAttribiteFild.h
//  ZJNews
//
//  Created by admin on 2019/12/20.
//  Copyright © 2019 FXEYE. All rights reserved.
//  装饰模式 + 策略模式的一种应用

#import <UIKit/UIKit.h>
#import "ZPTextAttribiteBaseVrify.h"



@interface ZPTextAttribiteFild : UIControl
/// placeHold 和 输入框的间距
@property (nonatomic, assign) CGFloat placeHoldSpaceFild;
/// 输入框距离底部的间距
@property (nonatomic, assign) CGFloat fildSpaceBottom;
/// 占位文字颜色
@property (nonatomic, strong) UIColor *placeholderTextColor;
/// 底部线的颜色
@property (nonatomic, strong) UIColor *lineColor;
/// 底部线选中后的颜色
@property (nonatomic, strong) UIColor *lineSelecateColor;
/// 占位文字大小
@property (nonatomic, strong) UIFont *placeholderFont;
/// 验证输入合法性
@property (nonatomic, strong) ZPTextAttribiteBaseVrify * verify;

@property(nullable, nonatomic,copy)   NSString               *text;                 // default is nil
@property(nullable, nonatomic,copy)   NSAttributedString     *attributedText API_AVAILABLE(ios(6.0)); // default is nil
@property(nullable, nonatomic,strong) UIColor                *textColor;            // default is nil. use opaque black
@property(nullable, nonatomic,strong) UIFont                 *font;                 // default is nil. use system font 12 pt
@property(nonatomic)        NSTextAlignment         textAlignment;        // default is NSLeftTextAlignment
@property(nonatomic)        UITextBorderStyle       borderStyle;          // default is UITextBorderStyleNone. If set to UITextBorderStyleRoundedRect, custom background images are ignored.
@property(nonatomic,copy)   NSDictionary<NSAttributedStringKey,id> *defaultTextAttributes API_AVAILABLE(ios(7.0)); // applies attributes to the full range of text. Unset attributes act like default values.
@property(nullable, nonatomic,copy)   NSString               *placeholder;          // default is nil. string is drawn 70% gray
@property(nullable, nonatomic,copy)   NSAttributedString     *attributedPlaceholder API_AVAILABLE(ios(6.0)); // default is nil
@property(nonatomic)        BOOL                    clearsOnBeginEditing; // default is NO which moves cursor to location clicked. if YES, all text cleared
@property(nonatomic)        BOOL                    adjustsFontSizeToFitWidth; // default is NO. if YES, text will shrink to minFontSize along baseline
@property(nonatomic)        CGFloat                 minimumFontSize;      // default is 0.0. actual min may be pinned to something readable. used if adjustsFontSizeToFitWidth is YES
@property(nullable, nonatomic,weak)   id<UITextFieldDelegate> delegate;             // default is nil. weak reference
@property(nullable, nonatomic,strong) UIImage                *background;           // default is nil. draw in border rect. image should be stretchable
@property(nullable, nonatomic,strong) UIImage                *disabledBackground;   // default is nil. ignored if background not set. image should be stretchable

@property(nonatomic,readonly,getter=isEditing) BOOL editing;
@property(nonatomic) BOOL allowsEditingTextAttributes API_AVAILABLE(ios(6.0)); // default is NO. allows editing text attributes with style operations and pasting rich text
@property(nullable, nonatomic,copy) NSDictionary<NSAttributedStringKey,id> *typingAttributes API_AVAILABLE(ios(6.0)); // automatically resets when the selection changes


// You can supply custom views which are displayed at the left or right
// sides of the text field. Uses for such views could be to show an icon or
// a button to operate on the text in the field in an application-defined
// manner.
//
// A very common use is to display a clear button on the right side of the
// text field, and a standard clear button is provided.

@property(nonatomic)        UITextFieldViewMode  clearButtonMode; // sets when the clear button shows up. default is UITextFieldViewModeNever

@property(nullable, nonatomic,strong) UIView              *leftView;        // e.g. magnifying glass
@property(nonatomic)        UITextFieldViewMode  leftViewMode;    // sets when the left view shows up. default is UITextFieldViewModeNever

@property(nullable, nonatomic,strong) UIView              *rightView;       // e.g. bookmarks button
@property(nonatomic)        UITextFieldViewMode  rightViewMode;
@end

