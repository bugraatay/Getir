//
//  ViewController.h
//  Getir
//
//  Created by M. Buğra Atay on 06/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPSessionManager.h"
#import "AFURLSessionManager.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *requestData;
@property (strong, nonatomic) NSMutableDictionary *responseData;

@property (weak, nonatomic) IBOutlet UITextField *txt_Mail;
@property (weak, nonatomic) IBOutlet UITextField *txt_AdSoyad;
@property (weak, nonatomic) IBOutlet UITextField *txt_Telefon;

- (IBAction)btn_Gonder:(id)sender;

- (void)postRequestWithData:(NSMutableDictionary *)requestData getData:(NSMutableDictionary *)responseData;


@end

