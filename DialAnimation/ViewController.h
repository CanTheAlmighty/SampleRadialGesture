//
//  ViewController.h
//  DialAnimation
//
//  Created by José Luis Canepa on 30/7/13.
//  Copyright (c) 2013 José Luis Canepa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DialView;

@interface ViewController : UIViewController

@property (nonatomic,weak) IBOutlet DialView *dial;

- (IBAction)didReceiveSpinPanGesture:(UIPanGestureRecognizer*)gesture;

@end
