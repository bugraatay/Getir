//
//  loginViewController.m
//  Getir
//
//  Created by M. Buğra Atay on 11/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_txt_Mail becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    CanvasViewController *vc = [segue destinationViewController];

    vc.user = [User new];
    [vc.user setName: _txt_AdSoyad.text];
    [vc.user setEmail: _txt_Mail.text];
    [vc.user setGsm: _txt_Telefon.text];
    
}

@end
