//
//  CanvasViewController.h
//  
//
//  Created by M. Buğra Atay on 06/03/2017.
//
//

#import <UIKit/UIKit.h>
#import "AFHTTPSessionManager.h"
#import "AFURLSessionManager.h"
#import "User.h"

@interface CanvasViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *responseData;
@property (strong, nonatomic) User *user;

- (IBAction)refreshButton:(id)sender;

- (void)postRequestWithUser:(User *)User;
@end
