//
//  MineNewAddressController.m
//  ZJNews
//
//  Created by admin on 2019/12/20.
//  Copyright © 2019 FXEYE. All rights reserved.
//

#import "MineNewAddressController.h"
#import "ZPTextAttribiteFild.h"
#import "ZPTextAttribiteNameVrify.h"

@interface MineNewAddressController ()

@property (weak, nonatomic) IBOutlet ZPTextAttribiteFild *lastNameFild;
@property (weak, nonatomic) IBOutlet ZPTextAttribiteFild *firstNameFild;
@property (weak, nonatomic) IBOutlet ZPTextAttribiteFild *addressFild;
@property (weak, nonatomic) IBOutlet ZPTextAttribiteFild *IDnumberFild;

@end

@implementation MineNewAddressController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    self.lastNameFild.placeholder = @"姓";
    self.firstNameFild.placeholder = @"名";
    self.addressFild.placeholder = @"详细地址";
    self.IDnumberFild.placeholder = @"身份证号";
    
    
    // 验证lastName
    self.lastNameFild.verify = [ZPTextAttribiteNameVrify new];
    
    
}
- (IBAction)verifyButtonClick:(UIButton *)sender {
    
    if (![self.lastNameFild.verify Verify:self.lastNameFild]) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@",self.lastNameFild.verify.errorMessage] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"lastNameFild：格式输入正确"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
