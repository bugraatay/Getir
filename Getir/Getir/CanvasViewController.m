//
//  CanvasViewController.m
//  
//
//  Created by M. Buğra Atay on 06/03/2017.
//
//

#import "CanvasViewController.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setUserInteractionEnabled:NO];
    [self showHint:@"Telefonu sallayarak ya da sağ üstteki butondan yeniden çizdirebilirsin."
         withTitle:[NSString stringWithFormat:@"Merhaba %@!", self.user.name]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        [self postRequestWithUser:self.user];
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}
-(void)postRequestWithUser:(User *)User {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization
                        dataWithJSONObject:@{
                                             @"email":User.email,
                                             @"name":User.name,
                                             @"gsm":User.gsm
                                             }
                        options:NSJSONWritingPrettyPrinted
                        error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]
                                    initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST"
                                                                             URLString:@"https://getir-bitaksi-hackathon.herokuapp.com/getElements"
                                                                            parameters:nil
                                                                                 error:nil];
    
    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [[manager dataTaskWithRequest:req
                completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                    
                    if (!error){
                        [self drawShapesWithResponseData:[responseObject objectForKey:@"elements"]];
                        NSLog(@"responseObject: %@", responseObject);
                        
                    }
                    else{
                        NSLog(@"istek gönderilirken bi hata oluştu: %@, %@, %@", error, response, responseObject);
                    }
                    
                }] resume];
    

}
- (void)drawShapesWithResponseData:(NSMutableDictionary *)response {
    
    for (NSMutableDictionary* item in response) {
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        
        if ([[item valueForKey:@"type"] isEqualToString:@"circle"]){
            
            [shapeLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake([[item valueForKey:@"xPosition"] floatValue],
                                                                                   [[item valueForKey:@"yPosition"] floatValue],
                                                                                   [[item valueForKey:@"r"] floatValue],
                                                                                   [[item valueForKey:@"r"] floatValue])] CGPath]];
            
        }
        else if ([[item valueForKey:@"type"] isEqualToString:@"rectangle"]){
            
            [shapeLayer setPath:[[UIBezierPath bezierPathWithRect:CGRectMake([[item valueForKey:@"xPosition"] floatValue],
                                                                               [[item valueForKey:@"yPosition"] floatValue],
                                                                               [[item valueForKey:@"width"] floatValue],
                                                                               [[item valueForKey:@"height"] floatValue])] CGPath]];
        }
        
        [shapeLayer setFillColor:[[self colorWithHexString:[item valueForKey:@"color"]] CGColor]];
        [self.view.layer addSublayer:shapeLayer];
    }

    

}
- (BOOL)canBecomeFirstResponder {
    return YES;
}
- (UIColor*)colorWithHexString:(NSString*)hex {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) return [UIColor grayColor];
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
- (IBAction)refreshButton:(id)sender {
    self.view.layer.sublayers = nil;
    [self postRequestWithUser:self.user];
}
-(void)showHint:(NSString*)message withTitle:(NSString *)title {
    UIAlertController *alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Anladım" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self postRequestWithUser:self.user];
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}
@end
