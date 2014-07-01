//
//  MessageBubbleView.m
//  Tumbler
//
//  Created by Shilya Lee on 6/29/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "MessageBubbleView.h"

@implementation MessageBubbleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(10, 455, 170, 62);
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"msg-bubble"]];
        [self addSubview:imgView];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
