//
//  User.h
//  Getir
//
//  Created by M. Buğra Atay on 19/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong, nonatomic) NSString *email, *name, *gsm;

- (id)initWithEMail:(NSString *)email
            andName:(NSString *)nameAndSurname
             andGSM:(NSString *)mobilePhone;
@end
