//
//  User.m
//  Getir
//
//  Created by M. Buğra Atay on 19/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithEMail:(NSString *)email andName:(NSString *)nameAndSurname andGSM:(NSString *)mobilePhone{
   
    self = [super init];
    
    if (self) {
        email = _email;
        nameAndSurname = _name;
        mobilePhone = _gsm;
    }
    
    return self;
}
@end
