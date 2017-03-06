//
//  ViewController.m
//  Getir
//
//  Created by M. Buğra Atay on 06/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _requestData = [NSMutableDictionary new];
    _responseData = [NSMutableDictionary new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn_Gonder:(id)sender {
    _requestData = [NSMutableDictionary dictionaryWithObjectsAndKeys:
             _txt_Mail.text, @"email",
             _txt_AdSoyad.text, @"name",
             _txt_Telefon.text, @"gsm",
             nil];
    [self postRequestWithData:_requestData getData:_responseData];
}

-(void)postRequestWithData:(NSMutableDictionary *)requestData getData:(NSMutableDictionary *)responseData{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization
                        dataWithJSONObject:requestData
                        options:NSJSONWritingPrettyPrinted
                        error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST"
                                                                             URLString:@"https://getir-bitaksi-hackathon.herokuapp.com/getElements"
                                                                            parameters:nil
                                                                                 error:nil];
    
    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            _responseData = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            NSLog(@"response başarılı %@", _responseData);
//            for(id item in [_responseData objectForKey:@"elements"]){
//                
//                NSLog(@"data: %@", item);
//            }
        } else
            NSLog(@"managePerson metodunda bi hata var: %@, %@, %@", error, response, responseObject);
        
    }] resume];
}

@end
