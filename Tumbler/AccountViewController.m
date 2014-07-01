//
//  AccountViewController.m
//  Tumbler
//
//  Created by Shilya Lee on 6/28/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "AccountViewController.h"
#import "MessageBubbleView.h"

@interface AccountViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (strong, nonatomic) MessageBubbleView *msgBubble;
@end

@implementation AccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.contentScrollView.contentSize = CGSizeMake(320, 600);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.msgBubble = [[MessageBubbleView alloc]init];
    //[self.view addSubview:self.msgBubble];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.msgBubble removeFromSuperview];
}


@end
