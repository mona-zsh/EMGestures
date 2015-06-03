//
//  ViewController.m
//  EMGestures
//
//  Created by Mona Zhang on 4/20/15.
//  Copyright (c) 2015 Mona Zhang. All rights reserved.
//

#import "EMTapGestureRecognizer.h"

#import "EMView.h"

#import "EMViewController.h"

@interface EMViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic) EMView *swipeView;
@property (nonatomic) UISwipeGestureRecognizer *swipeGesture;

@property (nonatomic) EMView *tapView;
@property (nonatomic) UITapGestureRecognizer *tapGesture;
@property (nonatomic) EMTapGestureRecognizer *emTapGesture;
@property (nonatomic) UITapGestureRecognizer *doubleTapGesture;
@property (nonatomic) UILongPressGestureRecognizer *longPressGesture;

@property (nonatomic) EMView *pinchView;
@property (nonatomic) UIPinchGestureRecognizer *pinchGesture;
@property (nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic) UIRotationGestureRecognizer *rotationGesture;

@end

@implementation EMViewController

- (EMView *)swipeView {
    if (!_swipeView) {
        _swipeView = [[EMView alloc] init];
        _swipeView.text = @"\"Gesture recognizers convert low-level event handling code into higher-level actions. They are objects that you attach to a view, which allows the view to respond to actions the way a control does.\"\n\nP.S. Swipe Me Left";
        [_swipeView addGestureRecognizer:self.swipeGesture];
    }
    return _swipeView;
}

- (EMView *)tapView {
    if (!_tapView) {
        _tapView = [[EMView alloc] init];
        _tapView.text = @"A touch goes to the gesture recognizer before the view!\n\nTap me for proof";
        [_tapView addGestureRecognizer:self.tapGesture];
    }
    return _tapView;
}

- (EMView *)pinchView {
    if (!_pinchView) {
        _pinchView = [[EMView alloc] init];
        _pinchView.text = @"Pinch me";
        [_pinchView addGestureRecognizer:self.pinchGesture];
    }
    return _pinchView;
}

- (UISwipeGestureRecognizer *)swipeGesture {
    if (!_swipeGesture) {
        _swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    }
    return _swipeGesture;
}

- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        _tapGesture.delegate = self;
    }
    return _tapGesture;
}

- (EMTapGestureRecognizer *)emTapGesture {
    if (!_emTapGesture) {
        _emTapGesture = [[EMTapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    }
    return _emTapGesture;
}

- (UITapGestureRecognizer *)doubleTapGesture {
    if (!_doubleTapGesture) {
        _doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        _doubleTapGesture.numberOfTapsRequired = 2;
        _doubleTapGesture.delegate = self;
    }
    return _doubleTapGesture;
}

- (UILongPressGestureRecognizer *)longPressGesture {
    if (!_longPressGesture) {
        _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    }
    return _longPressGesture;
}

- (UIPinchGestureRecognizer *)pinchGesture {
    if (!_pinchGesture) {
        _pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    }
    return _pinchGesture;
}

- (UIRotationGestureRecognizer *)rotationGesture {
    if (!_rotationGesture) {
        _rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    }
    return _rotationGesture;
}

- (UIPanGestureRecognizer *)panGesture {
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    }
    return _panGesture;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.swipeView];
    self.swipeView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Right");
        self.swipeView.text = @"Swipes only work in the default direction, right, unless otherwise specified. Try swiping left again.";
        
        /*
         Can we add more directions to the swipe gesture recognizer?
         */
        
        /*
         Attempt 1:
         */
        
        /*
        self.swipeGesture.direction = (UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionDown);
        [self.swipeView removeGestureRecognizer:self.swipeGesture];
        [self.swipeView addGestureRecognizer:self.swipeGesture];
         */
        
        /*
         Attempt 2:
         */
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [self.swipeView addGestureRecognizer:swipeLeft];
        
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.swipeView.text = @"Left!\n\nUse a new swipe gesture recognizer if you want to handle different directions.\n\nLuckily, \"A view can have multiple gesture recognizers, because a single view might respond to many different gestures.\"There was a left, right, and down gesture on this view.\n\nSwipe down to finish this off.";
        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
        [self.swipeView addGestureRecognizer:swipeDown];
        
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
        self.swipeView.text = @"Down we go!";
        [UIView animateWithDuration:1.0 animations:^{
            self.swipeView.center = CGPointMake(self.swipeView.center.x, self.swipeView.center.y + self.view.frame.size.height);
        }];
        [self.view addSubview:self.tapView];
        self.tapView.frame = CGRectMake(0, 0, self.view.frame.size.width, -self.view.frame.size.height);
        [UIView animateWithDuration:1.0 animations:^{
            self.tapView.frame = self.view.frame;
        }];
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
        self.swipeView.text = @"Up!";
    }
    
}

- (void)handleTap:(UITapGestureRecognizer *)sender {
    NSLog(@"(this is being called in the View Controller's handler)");
    self.tapView.text = @"Try tapping again and looking at the logs. The gesture receives the touch first, then the view, then the handler is called.";
    [self.tapView addGestureRecognizer:self.emTapGesture];
    [self.tapView addGestureRecognizer:self.doubleTapGesture];

    /*
     What happens when you add a gesture recognizer in a handler that is called multiple times?
     */
    /* NSLog(@"%@", self.tapView.gestureRecognizers);
     */
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)sender {
    self.tapView.text = @"A single view can have multiple gesture recognizers (this was a double tap).";
    [self.tapView addGestureRecognizer:self.longPressGesture];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)sender {
    self.tapView.text = @"A single view can have multiple gesture recognizers (this was a long press).";
    [UIView animateWithDuration:1.0 delay:1.0 options:0 animations:^{
        self.tapView.center = CGPointMake(self.swipeView.center.x, self.swipeView.center.y + self.view.frame.size.height);
    } completion:^(BOOL finished) {
        [self.tapView removeFromSuperview];
        
        [self.view addSubview:self.pinchView];
        self.pinchView.frame = CGRectMake(0, 0, self.view.frame.size.width, -self.view.frame.size.height);

        [UIView animateWithDuration:1.0 animations:^{
            self.pinchView.frame = self.view.frame;
        }];
    }];
}

- (void)handlePinch:(UIPinchGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.pinchView.text = @"The pinch began";
    }
    if (sender.state == UIGestureRecognizerStateChanged) {
        self.pinchView.text = @"The pinch changed";
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.pinchView.text = @"The pinch ended";
        [self.pinchView addGestureRecognizer:self.rotationGesture];
    }
}

- (void)handleRotation:(UIRotationGestureRecognizer *)sender {
    self.pinchView.text = @"Pinches and rotations go together.";
    self.pinchView.transform = CGAffineTransformRotate(self.pinchView.transform, sender.rotation);
    sender.rotation = 0.0;
    [self.pinchView addGestureRecognizer:self.panGesture];
}

- (void)handlePan:(UIPanGestureRecognizer *)sender {
    if ([sender state] == UIGestureRecognizerStateBegan) {
        self.pinchView.text = @"Pan gestures allow you to drag a view around.";
    }
    CGPoint touchLocation = [sender locationInView:self.view];
    self.pinchView.center = touchLocation;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    /*
     What happens if you comment this out?
     */
   // return YES;
    return NO;
}

@end
