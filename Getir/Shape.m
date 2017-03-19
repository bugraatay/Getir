//
//  Shape.m
//  Getir
//
//  Created by M. Buğra Atay on 19/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import "Shape.h"

@implementation Shape
-(id)initWithTypeCircular:(NSString *)shapeType andXPosition:(NSString *)xPositon andYPosition:(NSString *)yPostion andR:(NSString *)r andColor:(NSString *)color{
    
    self = [super init];
    
    if (self)
    {
        _type = shapeType;
        _xPosition = xPositon;
        _yPosition = yPostion;
        _r = r;
        _color = color;
    }
    
    return self;
}

-(id)initWithTypeQuadrilateral:(NSString *)shapeType andXPosition:(NSString *)xPositon andYPosition:(NSString *)yPostion andWith:(NSString *)quadrilateralWith andHeight:(NSString *)quadrilateralHeight andColor:(NSString *)color{
    self = [super init];
    
    if (self)
    {
        _type = shapeType;
        _xPosition = xPositon;
        _yPosition = yPostion;
        _with = quadrilateralWith;
        _height = quadrilateralHeight;
        _color = color;
    }
    
    return self;
}
@end
