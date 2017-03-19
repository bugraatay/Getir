//
//  Shape.h
//  Getir
//
//  Created by M. Buğra Atay on 19/03/2017.
//  Copyright © 2017 M. Buğra Atay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject

@property (strong, nonatomic) NSString *type, *xPosition, *yPosition, *r, *with, *height, *color;

- (id)initWithTypeCircular:(NSString *)shapeType
      andXPosition:(NSString *)xPositon
      andYPosition:(NSString *)yPostion
              andR:(NSString *)r
          andColor:(NSString *)color;

- (id)initWithTypeQuadrilateral:(NSString *)shapeType
                   andXPosition:(NSString *)xPositon
                   andYPosition:(NSString *)yPostion
                        andWith:(NSString *)quadrilateralWith
                      andHeight:(NSString *)quadrilateralHeight
                       andColor:(NSString *)color;

@end
