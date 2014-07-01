//
//  MainViewController.m
//  Tumbler
//
//  Created by Shilya Lee on 6/28/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "AccountViewController.h"
#import "ComposeOptionViewController.h"
#import "ActivityViewController.h"
#import "MessageBubbleView.h"
#import "LoginViewController.h"

@interface MainViewController ()

- (IBAction)onHomeButton:(id)sender;
- (IBAction)onSearchButton:(id)sender;
- (IBAction)onComposeButton:(id)sender;
- (IBAction)onAccountButton:(id)sender;
- (IBAction)onActivityButton:(id)sender;
- (void)surfaceBubble;
- (void)hideBubble;
- (IBAction)onLoginButton:(id)sender;
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer;


@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property(strong, nonatomic) UINavigationController *homeNavViewCtr;
@property(strong, nonatomic) SearchViewController *searchViewCtr;
@property(strong, nonatomic) ComposeOptionViewController *composeOptionViewCtr;
@property(strong, nonatomic) AccountViewController *accountViewCtr;
@property(strong, nonatomic) ActivityViewController *activityViewCtr;
@property(strong, nonatomic) MessageBubbleView *messageBubble;

@property(strong, nonatomic) LoginViewController *loginViewCtr;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        HomeViewController *homeViewCtr = [[HomeViewController alloc]init];
        self.homeNavViewCtr = [[UINavigationController alloc]initWithRootViewController:homeViewCtr];
        [self.homeNavViewCtr.navigationBar setBarTintColor:[UIColor colorWithRed:68/255.0f green:84/255.0f blue:103/255.0f alpha:1]];
        [self.homeNavViewCtr.navigationBar setTranslucent:NO];
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        self.homeNavViewCtr.navigationBar.titleTextAttributes = titleTextAttributes;
    
        self.searchViewCtr = [[SearchViewController alloc]init];
        self.composeOptionViewCtr = [[ComposeOptionViewController alloc]init];
        self.accountViewCtr = [[AccountViewController alloc]init];
        self.activityViewCtr = [[ActivityViewController alloc]init];
        self.messageBubble = [[MessageBubbleView alloc]init];
        
        self.loginViewCtr = [[LoginViewController alloc]init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.contentView addSubview:self.homeNavViewCtr.view ];
    
    [self.view addSubview:self.messageBubble];
    [self surfaceBubble];
    [self showLogin];
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.loginViewCtr.view addGestureRecognizer:singleFingerTap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

-(void)viewDidAppear:(BOOL)animated
{
  

}

- (IBAction)onHomeButton:(id)sender
{
    self.homeNavViewCtr.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.homeNavViewCtr.view];
    [self surfaceBubble];
    [self showLogin];
}
- (IBAction)onSearchButton:(id)sender
{
    self.searchViewCtr.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.searchViewCtr.view];
    [self hideBubble];
    [self hideLogin];
}
- (IBAction)onComposeButton:(id)sender
{
    self.composeOptionViewCtr.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.composeOptionViewCtr.view];
    [UIView animateWithDuration:1 animations:^{
       self.composeOptionViewCtr.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
    //[self hideLogin];
    //[self presentViewController:self.composeOptionViewCtr animated:YES completion:nil];
}
- (IBAction)onAccountButton:(id)sender
{
    self.accountViewCtr.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.accountViewCtr.view];
    [self surfaceBubble];
    [self hideLogin];
}

- (IBAction)onActivityButton:(id)sender
{
    self.activityViewCtr.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.activityViewCtr.view];
    [self surfaceBubble];
    [self hideLogin];
}

-(void)surfaceBubble
{
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.2 options:0 animations:^{
        self.messageBubble.frame = CGRectMake(self.messageBubble.frame.origin.x, 455, self.messageBubble.frame.size.width, self.messageBubble.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:0.8 delay:0 options:UIViewKeyframeAnimationOptionAutoreverse |UIViewKeyframeAnimationOptionRepeat animations:^{
            
            self.messageBubble.frame = CGRectMake(10, 463, 170, 62);
            
        } completion:nil];
    }];
    
}

-(void)hideBubble
{
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.2 options:0 animations:^{
        self.messageBubble.frame = CGRectMake(self.messageBubble.frame.origin.x, self.messageBubble.frame.origin.y+500, self.messageBubble.frame.size.width, self.messageBubble.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)showLogin
{
    self.loginButton.hidden = NO;
}

-(void)hideLogin
{
    self.loginButton.hidden = YES;
}

- (IBAction)onLoginButton:(id)sender {
    self.loginViewCtr.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.loginViewCtr.view];
    [UIView animateWithDuration:0.3 animations:^{
        self.loginViewCtr.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
    }];

}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer{
    
    [UIView animateWithDuration:0.3 animations:^{
        recognizer.view.frame = CGRectMake(0, 568, 320, 568);
    } completion:^(BOOL finished) {
        //[recognizer.view removeFromSuperview];
    }];
}




@end
