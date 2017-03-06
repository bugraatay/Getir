//
//  CanvasViewController.h
//  
//
//  Created by M. Buğra Atay on 06/03/2017.
//
//

#import <UIKit/UIKit.h>

@interface CanvasViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbl_ShowData;

@property (strong, nonatomic) NSMutableDictionary *responseData;
@end
