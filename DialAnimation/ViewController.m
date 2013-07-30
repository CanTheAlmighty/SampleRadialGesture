//
//  ViewController.m
//  DialAnimation
//
//  Created by José Luis Canepa on 30/7/13.
//  Copyright (c) 2013 José Luis Canepa. All rights reserved.
//

#import "ViewController.h"
#import "DialView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)didReceiveSpinPanGesture:(UIPanGestureRecognizer*)gesture
{
    // This struct encapsulates the state of the gesture
    struct state
    {
        CGPoint touch;          // Current touch position
        CGFloat angle;          // Angle of the view
        CGFloat touchAngle;     // Angle between the finger and the view
        CGPoint center;         // Center of the view
    };
    
    // Static variable to record the beginning state
    // (alternatively, use a @property or an _ivar)
    static struct state begin;
    
    CGPoint touch = [gesture locationInView:nil];
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        begin.touch  = touch;
        begin.angle  = self.dial.angle;
        begin.center = self.dial.center;
        
        begin.touchAngle = CGPointAngle(begin.touch, begin.center);
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        struct state now;
        now.touch   = touch;
        now.center  = begin.center;
        
        // Get the current angle between the finger and the center
        now.touchAngle = CGPointAngle(now.touch, now.center);
        
        // The angle of the view shall be the original angle of the view
        // plus or minus the difference between the two touch angles
        now.angle = begin.angle - (begin.touchAngle - now.touchAngle);
        
        self.dial.angle = now.angle;
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        // Number of "buttons"
        NSInteger buttons = 8;
        
        // Angle between buttons
        CGFloat angleDistance = M_PI*2 / buttons;
        
        // Get the closest angle
        CGFloat closest = round(self.dial.angle / angleDistance) * angleDistance;
        
        [UIView animateWithDuration:0.15 animations:^{
            self.dial.angle = closest;
        }];
    }
}

CGFloat CGPointAngle(CGPoint a, CGPoint b)
{
    return atan2(a.y - b.y, a.x - b.x);
}

@end
