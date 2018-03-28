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
}

- (UIView*)indefiniteAnimatedLayer {
    if(!_indefiniteAnimatedLayer) {
        _indefiniteAnimatedLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width * 0.5, self.frame.size.height * 0.5)];
        _indefiniteAnimatedLayer.center = self.center;
        _indefiniteAnimatedLayer.backgroundColor = [UIColor clearColor];
        
        LOTAnimationView *animationView = [LOTAnimationView animationNamed:@"loader"];
        [animationView setContentMode:UIViewContentModeScaleAspectFill];
        [animationView setFrame:_indefiniteAnimatedLayer.bounds];
        [animationView setLoopAnimation:true];
        [animationView setUserInteractionEnabled:false];
        [animationView play];
        [_indefiniteAnimatedLayer addSubview:animationView];
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

