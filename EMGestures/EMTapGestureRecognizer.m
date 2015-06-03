//
//  EMTapGestureRecognizer.m
//  EMGestures
//
//  Created by Mona Zhang on 4/27/15.
//  Copyright (c) 2015 Mona Zhang. All rights reserved.
//

#import <UIKit/UIGestureRecognizerSubclass.h>

#import "EMTapGestureRecognizer.h"

@implementation EMTapGestureRecognizer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Knock knock in the custom tap touch");
}

@end
