//
//  UITextAttribiteFild.m
//  ZJNews
//
//  Created by admin on 2019/12/20.
//  Copyright © 2019 FXEYE. All rights reserved.


#import "ZPTextAttribiteFild.h"
#import "Masonry.h"

@interface  ZPTextAttribiteFild()
/**<#name#>*/
@property (nonatomic, strong) UILabel *placeholderLabel;
/**<#name#>*/
@property (nonatomic, strong) UITextField *textField;
/**<#name#>*/
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIView *selecateLineView;



@end

@implementation ZPTextAttribiteFild
- (UIView *)lineView
{
    if (_lineView == nil) {
        UIView * tempView = [UIView new];
        _lineView = tempView;
        tempView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}
- (UIView *)selecateLineView
{
    if (_selecateLineView == nil) {
        UIView * tempView = [UIView new];
        _selecateLineView = tempView;
        _selecateLineView.transform = CGAffineTransformMakeScale(CGFLOAT_MIN, 1);
        tempView.backgroundColor = [UIColor redColor];
        
    }
    return _selecateLineView;
}
- (UITextField *)textField{
    if (!_textField) {
        UITextField * text = [[UITextField alloc] init];
        _textField = text;
        [text addTarget:self action:@selector(DidEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
        [text addTarget:self action:@selector(beginEditing:) forControlEvents:UIControlEventEditingDidBegin];
        [text addTarget:self action:@selector(editingValueChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}
- (void)editingValueChange:(UITextField *)textFild{
    [self sendActionsForControlEvents:UIControlEventEditingChanged];
}
// 结束编辑
- (void)DidEndEditing:(UITextField *)fild{
    [self sendActionsForControlEvents:UIControlEventEditingDidEnd];
    if (fild.text.length <= 0) {
        [self makeConstraints];
    }
       [UIView animateWithDuration:0.25 animations:^{
          self.selecateLineView.transform = CGAffineTransformMakeScale(CGFLOAT_MIN, 1);
       }];
}
- (void)beginEditing:(UITextField *)fild{
    [self sendActionsForControlEvents:UIControlEventEditingDidBegin];
    if (fild.text.length <= 0) {
       [self beginEditingmakeConstraints];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.selecateLineView.transform= CGAffineTransformIdentity;
    }];
}
- (UILabel *)placeholderLabel{
    if (!_placeholderLabel) {
        UILabel * placeHodel = [UILabel new];
        placeHodel.layer.anchorPoint = CGPointMake(0, 0);
        _placeholderLabel = placeHodel;
    }
    return _placeholderLabel;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
   self = [super initWithCoder:coder];
    if (self) {
       [self addSubview:self.textField];
       [self addSubview:self.placeholderLabel];
        [self addSubview:self.lineView];
        [self addSubview:self.selecateLineView];

        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBeginEditing)];
       [self addGestureRecognizer:tap];
       [self makeConstraints];
    }
    return self;
}

- (void)tapBeginEditing{
    [self.textField becomeFirstResponder];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textField];
        [self addSubview:self.placeholderLabel];
        [self addSubview:self.lineView];
        [self addSubview:self.selecateLineView];
        [self makeConstraints];
    }
    return self;
}
- (void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderFont  = placeholderFont;
    self.placeholderLabel.font = placeholderFont;
}
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor{
    _placeholderTextColor =  placeholderTextColor;
    self.placeholderLabel.textColor = placeholderTextColor;
}
- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.lineView.backgroundColor = lineColor;
}
- (void)setLineSelecateColor:(UIColor *)lineSelecateColor{
    _lineSelecateColor = lineSelecateColor;
    self.selecateLineView.backgroundColor = lineSelecateColor;
}
- (void)setPlaceHoldSpaceFild:(CGFloat)placeHoldSpaceFild{
    _placeHoldSpaceFild = placeHoldSpaceFild;
    [self makeConstraints];
}
- (void)setFildSpaceBottom:(CGFloat)fildSpaceBottom{
    _fildSpaceBottom = fildSpaceBottom;
    [self makeConstraints];
}
- (void)makeConstraints{
    // 修改了锚点 - 注意点
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.equalTo(@(0.5));
    }];
    [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
           make.left.right.equalTo(self);
           make.height.equalTo(@(self.textField.font.lineHeight+1));
           make.bottom.equalTo(self).offset(-self.fildSpaceBottom);
    }];
    [self.placeholderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left);//centerX -> left
        make.bottom.equalTo(self.mas_bottom).offset(-(self.fildSpaceBottom + self.placeholderLabel.font.lineHeight/2.0));//bottom -> centerY
    }];
    [self.selecateLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
           make.left.bottom.equalTo(self.lineView);
           make.height.equalTo(@(1.5));
           make.width.equalTo(self.lineView);
     }];
    if(!CGAffineTransformEqualToTransform(self.placeholderLabel.transform , CGAffineTransformIdentity)) {
            [UIView animateWithDuration:0.25 animations:^{
             [self layoutIfNeeded];
             self.placeholderLabel.transform = CGAffineTransformIdentity;
       }];
    }
}
- (void)beginEditingmakeConstraints{
//    centerY -> top
//    bottom -> centerY
//    centerX -> left
        [self.placeholderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_left);
            make.bottom.equalTo(self.textField.mas_top).offset(-(self.placeHoldSpaceFild + self.placeholderLabel.font.lineHeight/2.0));
        }];
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.equalTo(@(self.textField.font.lineHeight+1));
            make.bottom.equalTo(self).offset(-self.fildSpaceBottom);
        }];
    if (self.text.length > 0) {
        self.placeholderLabel.transform = CGAffineTransformMakeScale(13.0/15, 13.0/15);
        return;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
        self.placeholderLabel.transform = CGAffineTransformMakeScale(13.0/15, 13.0/15);
    } completion:^(BOOL finished) {
       
    }];
}


- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder{
    _attributedPlaceholder = attributedPlaceholder;
    self.placeholderLabel.attributedText = attributedPlaceholder;
}
- (void)setClearsOnBeginEditing:(BOOL)clearsOnBeginEditing{
    _clearsOnBeginEditing = clearsOnBeginEditing;
    self.textField.clearsOnBeginEditing = clearsOnBeginEditing;
}
- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth{
    _adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
    self.textField.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
}
- (void)setMinimumFontSize:(CGFloat)minimumFontSize{
    _minimumFontSize = minimumFontSize;
    self.textField.minimumFontSize = minimumFontSize;
}
- (void)setDelegate:(id<UITextFieldDelegate>)delegate{
    _delegate = delegate;
    self.textField.delegate = delegate;
}
- (void)setBackground:(UIImage *)background{
    _background  = background;
    self.textField.background = background;
}
- (void)setDisabledBackground:(UIImage *)disabledBackground{
    _disabledBackground = disabledBackground;
    self.textField.disabledBackground = disabledBackground;
}

- (BOOL)isEditing{
    
    return  self.textField.editing;
}
- (void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes{
    _allowsEditingTextAttributes = allowsEditingTextAttributes;
    self.textField.allowsEditingTextAttributes = allowsEditingTextAttributes;
}
- (void)setTypingAttributes:(NSDictionary<NSAttributedStringKey,id> *)typingAttributes{
    _typingAttributes = typingAttributes;
    self.textField.typingAttributes = typingAttributes;
}
- (void)setClearButtonMode:(UITextFieldViewMode)clearButtonMode{
    _clearButtonMode = clearButtonMode;
    self.textField.clearButtonMode = clearButtonMode;
}
- (void)setLeftView:(UIView *)leftView{
    _leftView = leftView;
    self.textField.leftView = leftView;
}
- (void)setRightView:(UIView *)rightView{
    _rightView = rightView;
    self.textField.rightView = rightView;
}
- (void)setRightViewMode:(UITextFieldViewMode)rightViewMode{
    _rightViewMode = rightViewMode;
    self.textField.rightViewMode = rightViewMode;
}
- (void)setText:(NSString *)text{
    
    if (self.textField.text.length <=0 && text.length > 0) {
         self.textField.text = text;
         [self beginEditingmakeConstraints];
    }
    self.textField.text = text;
    
}
- (NSString *)text{
    
    return self.textField.text;
}
- (void)setAttributedText:(NSAttributedString *)attributedText{
    _attributedText = attributedText;
    if (self.textField.attributedText.length <=0 && attributedText.length > 0) {
         self.textField.attributedText = attributedText;
         [self beginEditingmakeConstraints];
    }
    self.textField.attributedText = attributedText;
}
- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.textField.textColor = textColor;
}
- (void)setFont:(UIFont *)font{
    _font = font;
    self.textField.font = font;
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    _textAlignment = textAlignment;
    self.textField.textAlignment = textAlignment;
}
- (void)setBorderStyle:(UITextBorderStyle)borderStyle{
    _borderStyle = borderStyle;
    self.textField.borderStyle = borderStyle;
}

- (void)setDefaultTextAttributes:(NSDictionary<NSAttributedStringKey,id> *)defaultTextAttributes{
    _defaultTextAttributes = defaultTextAttributes;
    self.textField.defaultTextAttributes = defaultTextAttributes;
}
@end
