//
//  SVIndefiniteAnimatedView.m
//  SVProgressHUD, https://github.com/SVProgressHUD/SVProgressHUD
//
//  Copyright (c) 2014-2017 Guillaume Campagna. All rights reserved.
//

#import "SVIndefiniteAnimatedView.h"
#import "SVProgressHUD.h"
#import <Lottie/Lottie.h>

@interface SVIndefiniteAnimatedView ()

@property (nonatomic, strong) UIView *indefiniteAnimatedLayer;

@end

@implementation SVIndefiniteAnimatedView

- (void)willMoveToSuperview:(UIView*)newSuperview {
    if (newSuperview) {
        [self layoutAnimatedLayer];
    } else {
        [_indefiniteAnimatedLayer removeFromSuperview];
        _indefiniteAnimatedLayer = nil;
    }
}

- (void)layoutAnimatedLayer {
    UIView *layer = self.indefiniteAnimatedLayer;
    [self addSubview: layer];
    
    CGFloat widthDiff = CGRectGetWidth(self.bounds) - CGRectGetWidth(layer.bounds);
    CGFloat heightDiff = CGRectGetHeight(self.bounds) - CGRectGetHeight(layer.bounds);
//    layer.position = CGPointMake(CGRectGetWidth(self.bounds) - CGRectGetWidth(layer.bounds) / 2 - widthDiff / 2, CGRectGetHeight(self.bounds) - CGRectGetHeight(layer.bounds) / 2 - heightDiff / 2);
}

- (UIView*)indefiniteAnimatedLayer {
    if(!_indefiniteAnimatedLayer) {
        _indefiniteAnimatedLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _indefiniteAnimatedLayer.center = self.center
        _indefiniteAnimatedLayer.backgroundColor = [UIColor redColor]
    }
    return _indefiniteAnimatedLayer;
}

- (void)setFrame:(CGRect)frame {
    if(!CGRectEqualToRect(frame, super.frame)) {
        [super setFrame:frame];
        
        if(self.superview) {
            [self layoutAnimatedLayer];
        }
    }
    
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake((self.radius+self.strokeThickness/2+5)*2, (self.radius+self.strokeThickness/2+5)*2);
}

@end
