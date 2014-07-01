//
//  ComposeOptionViewController.m
//  Tumbler
//
//  Created by Shilya Lee on 6/29/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "ComposeOptionViewController.h"

@interface ComposeOptionViewController ()
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (strong, nonatomic) NSArray *optionsTitleArray;
- (void)renderLinks;
- (void)addLinkItem:(int)i positionX:(float)x positionY:(float)y width:(float)w height:(float)h;
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer;

@end


@implementation ComposeOptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.optionsTitleArray = [NSArray arrayWithObjects:@"Text",@"Photo",@"Quote", @"Link", @"Chat", @"Video",nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"compose view did load");
    // Do any additional setup after loading the view from its nib.
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 586)];
    contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:contentView];
    [self renderLinks];
    UILabel *dismissLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 515, 320, 53)];
    dismissLabel.text = @"Nevermind";
    dismissLabel.textColor = [UIColor colorWithRed:116/255.0f green:127/255.0f blue:139/255.0f alpha:1];
    [dismissLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:dismissLabel];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)renderLinks{
    for(int i = 0; i < 6; i++){
        float x = (i % 3 *100) + 25;
        float y = (floor(i/ 3) *107) + 160;
        [self addLinkItem:i positionX:x positionY:y width:75 height:100];
    }
}

- (void)addLinkItem:(int)i positionX:(float)x positionY:(float)y width:(float)w height:(float)h{
    
    UIView *option = [[UIView alloc] initWithFrame:CGRectMake(x, y+self.view.frame.size.height, w, h)];
    NSMutableString *imgName = [NSMutableString stringWithFormat:@"compose-option-%d", i];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 72, w, 30)];
    label.text = self.optionsTitleArray[i];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    [option addSubview:imgView];
    [option addSubview:label];
    
    [self.view addSubview:option];
    [UIView animateWithDuration:0.7 delay:i*0.3 usingSpringWithDamping:0.82f initialSpringVelocity:0.2f options:0 animations:^{
        option.frame = CGRectMake(x, y, w, h);
    } completion:nil];
}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer{
    for(int i = 0; i < 6; i++){
        UIView *option = [recognizer.view subviews][i+1];
        [UIView animateWithDuration:1 delay:i*0.2 usingSpringWithDamping:0.82f initialSpringVelocity:0.2f options:0 animations:^{
           option.frame = CGRectMake(option.frame.origin.x, option.frame.origin.y - 1000 , option.frame.size.width, option.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
    
    [UIView animateWithDuration:1.2 delay:1.6 usingSpringWithDamping:0.82f initialSpringVelocity:0.2f options:0  animations:^{
        recognizer.view.frame = CGRectMake(0, [recognizer.view superview].frame.size.height, [recognizer.view superview].frame.size.width, [recognizer.view superview].frame.size.height);
    } completion:^(BOOL finished) {
        [recognizer.view removeFromSuperview];
    }];

}

@end
