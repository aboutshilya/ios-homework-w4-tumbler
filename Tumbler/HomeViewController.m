//
//  HomeViewController.m
//  Tumbler
//
//  Created by Shilya Lee on 6/28/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "HomeViewController.h"
#import "MessageBubbleView.h"
#import "LoginViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollContentView;

@end

@implementation HomeViewController

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
    self.scrollContentView.contentSize = CGSizeMake(320, 600);
    self.title =  @"Home";
    //NSLog(@"nav title %@", self.navigationController);
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStylePlain target:self action:@selector(onLoginButton)];
//    [rightButton setTintColor:[UIColor whiteColor]];
//    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
