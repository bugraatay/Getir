//
//  loginViewController.m
//  Getir
//
//  Created by M. Buğra Atay on 11/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController () <UITextFieldDelegate>

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_txt_Mail becomeFirstResponder];
    _btn_Basla.enabled = NO;
    _btn_Basla.alpha = 0.5f;
    
    self.nameFlag = NO;
    self.mailFlag = NO;
    self.gsmFlag = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    textField.text = [textField.text stringByReplacingCharactersInRange:range withString:[string uppercaseString]];
    
    [self.btn_Basla setEnabled:[self setButtonEnabledWithTextField:textField]];
    self.btn_Basla.alpha = self.btn_Basla.enabled ? 1.0f : 0.5f;
    
    return NO;
}
-(BOOL)setButtonEnabledWithTextField:(UITextField *)textFied{
    
    for(textFied in self.view.subviews){
        if (textFied.tag == 10) {
            if (textFied.text.length) {
                self.mailFlag = YES;
            }
            else{
                self.mailFlag = NO;
            }
        }
        else if (textFied.tag == 20){
            if (textFied.text.length) {
                self.nameFlag = YES;
            }
            else{
                self.nameFlag = NO;
            }
        }
        else if (textFied.tag == 30){
            if (textFied.text.length) {
                self.gsmFlag = YES;
            }
            else{
                self.gsmFlag = NO;
            }
        }
    }
    
    if(self.mailFlag && self.gsmFlag && self.nameFlag){
        return YES;
    }
    else{
        return NO;
    }
    
}
- (IBAction)unwindToLoginPage:(UIStoryboardSegue *)unwindSegue
{
    UIViewController* sourceViewController = unwindSegue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[CanvasViewController class]])
    {
        NSLog(@"Coming from canvas!");
    }
    
    self.txt_Telefon.text = @"";
    self.txt_Mail.text = @"";
    self.txt_AdSoyad.text = @"";
    [self.txt_Mail becomeFirstResponder];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    CanvasViewController *vc = [segue destinationViewController];

    vc.user = [User new];
    [vc.user setName: _txt_AdSoyad.text];
    [vc.user setEmail: _txt_Mail.text];
    [vc.user setGsm: _txt_Telefon.text];
    
}

@end
