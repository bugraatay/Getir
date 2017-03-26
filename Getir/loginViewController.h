//
//  loginViewController.h
//  Getir
//
//  Created by M. Buğra Atay on 11/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPSessionManager.h"
#import "AFURLSessionManager.h"
#import "CanvasViewController.h"

@interface loginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_Mail;
@property (weak, nonatomic) IBOutlet UITextField *txt_AdSoyad;
@property (weak, nonatomic) IBOutlet UITextField *txt_Telefon;
@property (weak, nonatomic) IBOutlet UIButton *btn_Basla;

@property BOOL nameFlag;
@property BOOL mailFlag;
@property BOOL gsmFlag;

@end
