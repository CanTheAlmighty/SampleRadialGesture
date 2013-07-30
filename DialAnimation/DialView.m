//
//  DialView.m
//  DialAnimation
//
//  Created by José Luis Canepa on 30/7/13.
//  Copyright (c) 2013 José Luis Canepa. All rights reserved.
//

#import "DialView.h"

@implementation DialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setAngle:(CGFloat)angle
{
    _angle = angle;
    
    self.transform = CGAffineTransformMakeRotation(angle);
}

/*
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    // Fake diameter, it's basically the average of both sides
    // (you could also define it yourself, or use the diagonal of the square, for better results)
    CGFloat diameter = (self.bounds.size.width + self.bounds.size.height) / 2.0;
    
    // Make sure the point has the transform applied
    point = CGPointApplyAffineTransform(point, CGAffineTransformInvert(self.transform));
    
    CGFloat distance = CGPointDistance(self.center, point);
    
    NSLog(@"Distance: %f", distance);
    
    // If the Euclidian distance between the point and our center is less than our radius
    if (distance < diameter/2.0)
    {
        return YES;
    }
    
    return NO;
}*/

CGFloat CGPointDistance(CGPoint a, CGPoint b)
{
    return sqrt(pow((a.x - b.x), 2) + pow((a.y - b.y), 2));
}

@end
