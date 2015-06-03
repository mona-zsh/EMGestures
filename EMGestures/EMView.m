//
//  FirstView.m
//  EMGestures
//
//  Created by Mona Zhang on 4/20/15.
//  Copyright (c) 2015 Mona Zhang. All rights reserved.
//

#import "EMView.h"

@interface EMView ()

@property (nonatomic) UILabel *label;

@end

@implementation EMView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 3.0;
        self.layer.shadowColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:36/255.0 alpha:1.0].CGColor;
    }
    return self;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:16];
        _label.textColor = [UIColor colorWithRed:73/255.0 green:75/255.0 blue:75/255.0 alpha:1.0];
        _label.numberOfLines = 0;
    }
    return _label;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

- (NSString *)text {
    return self.label.text;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    EMLog(@"Touches began");
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(15, 15, self.frame.size.width - 30, self.frame.size.height - 30);
}

@end
