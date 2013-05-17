//
//  WWDCViewController.m
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import "WWDCViewController.h"

@interface WWDCViewController ()
@property(nonatomic, strong) UIView* secondaryControls;
@property(nonatomic, strong) OBShapedButton* switcherRef;
@property(nonatomic, getter=controlsAreVisible) BOOL controlsVisible;
@end

@implementation WWDCViewController

-(GridManager*)gridManager
{
    if(!_gridManager){
        _gridManager = [[GridManager alloc] init];
    }
    return _gridManager;
}

-(ScreenManager*)screenManager
{
    if(!_screenManager){
        _screenManager = [[ScreenManager alloc] init];
    }
    return _screenManager;
}

-(UIView*)secondaryControls
{
    if(!_secondaryControls) {
        _secondaryControls = [[UIView alloc] init];
    }
    return _secondaryControls;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    // set up grid manager
    [self.view addSubview:self.gridManager.view];
    
  /*  // temporary screen switch buttons
    UIButton* aboutButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 385, 80, 25)];
    UIButton* projectsButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 385, 80, 25)];
    UIButton* educationButton = [[UIButton alloc] initWithFrame:CGRectMake(210, 385, 80, 25)];
    
    // give them some color
    [aboutButton setBackgroundColor:[UIColor blackColor]];
    [projectsButton setBackgroundColor:[UIColor blackColor]];
    [educationButton setBackgroundColor:[UIColor blackColor]];
    
    [aboutButton setTag:0];
    [projectsButton setTag:1];
    [educationButton setTag:2];
    
    // add targets
    [aboutButton addTarget:self action:@selector(loadNewScreen:) forControlEvents:UIControlEventTouchUpInside];
    [projectsButton addTarget:self action:@selector(loadNewScreen:) forControlEvents:UIControlEventTouchUpInside];
    [educationButton addTarget:self action:@selector(loadNewScreen:) forControlEvents:UIControlEventTouchUpInside];
    
    // add to view
    [self.view addSubview:aboutButton];
    [self.view addSubview:projectsButton];
    [self.view addSubview:educationButton];*/
    
    //  set up secondary controls
    [self.secondaryControls setFrame:CGRectMake(45.0/2.0, self.view.frame.size.height-78, 275, 78)];
    [self.view addSubview:self.secondaryControls];
    
    OBShapedButton* switcher = [[OBShapedButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 75, self.view.frame.size.height - 38, 150, 38)];
    self.switcherRef = switcher;
    [switcher setBackgroundImage:[UIImage imageNamed:@"switcher_default"] forState:UIControlStateNormal];
    [switcher setBackgroundImage:[UIImage imageNamed:@"switcher_highlighted"] forState:UIControlStateSelected];
    [switcher addTarget:self action:@selector(displaySecondarySelectors) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:switcher];
    
    
    OBShapedButton* projects = [[OBShapedButton alloc] initWithFrame:CGRectMake(0, 0, 275, 78)];
    projects.tag = 0;
    [projects setBackgroundImage:[UIImage imageNamed:@"projects_default"] forState:UIControlStateNormal];
    [projects addTarget:self action:@selector(loadNewScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondaryControls addSubview:projects];
    
    OBShapedButton* education = [[OBShapedButton alloc] initWithFrame:CGRectMake(0, 0, 275, 78)];
    education.tag = 1;
    [education setBackgroundImage:[UIImage imageNamed:@"education_default"] forState:UIControlStateNormal];
    [education addTarget:self action:@selector(loadNewScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondaryControls addSubview:education];
    
    OBShapedButton* skills = [[OBShapedButton alloc] initWithFrame:CGRectMake(0, 0, 275, 78)];
    skills.tag = 2;
    [skills setBackgroundImage:[UIImage imageNamed:@"skills_default"] forState:UIControlStateNormal];
    [skills addTarget:self action:@selector(loadNewScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondaryControls addSubview:skills];
    
    OBShapedButton* interests = [[OBShapedButton alloc] initWithFrame:CGRectMake(0, 0, 275, 78)];
    interests.tag = 3;
    [interests setBackgroundImage:[UIImage imageNamed:@"interests_defualt"] forState:UIControlStateNormal];
    [interests addTarget:self action:@selector(loadNewScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondaryControls addSubview:interests];
    
    self.secondaryControls.transform = CGAffineTransformScale(self.secondaryControls.transform, .4, .4);
    self.secondaryControls.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.secondaryControls.frame)/2);
}

-(void)displaySecondarySelectors
{
    self.switcherRef.selected = !self.switcherRef.isSelected;
    
    if (!self.controlsAreVisible)
    {
        self.controlsVisible = TRUE;
        [UIView animateWithDuration:0.3 animations:^{
            self.secondaryControls.transform = CGAffineTransformScale(self.secondaryControls.transform, 2.5, 2.5);
            self.secondaryControls.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - self.secondaryControls.frame.size.height/2);}];
    }
    
    else
    {
        self.controlsVisible = FALSE;
        [UIView animateWithDuration:0.3 animations:^{
            self.secondaryControls.transform = CGAffineTransformScale(self.secondaryControls.transform, .4, .4);
            self.secondaryControls.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - self.secondaryControls.frame.size.height/2);}];
    }
}

-(void)loadNewScreen:(UIButton*)sender
{
    //  hides the selectors
    [self displaySecondarySelectors];
    
    // first set the new current screen
    switch(sender.tag)
    {
        case 0:
            [self.screenManager changeScreen:@"Projects"];
            break;
        case 1:
            [self.screenManager changeScreen:@"Education"];
            break;
        case 2:
            [self.screenManager changeScreen:@"Skills"];
            break;
        case 3:
            [self.screenManager changeScreen:@"Interests"];
            break;
    }
    
    // then load the new screen view
    [UIView animateWithDuration:FLIP_TIME
                     animations:^{
        [self.screenManager.currentScreen setAlpha:1.0];
        [self.screenManager.currentScreen setAlpha:0.0];}
                     completion:^(BOOL finished){[self.screenManager.currentScreen removeFromSuperview];
                                                 [self.screenManager loadCurrentScreenToView];}];

    
    // then update the grid
    float delay = [self.gridManager loadNewScreen:[self.screenManager getCurrentGrid]];
    
    // then add the view to the screen
    [self performSelector:@selector(finishScreenLoad) withObject:nil afterDelay:delay];

}

-(void)finishScreenLoad
{
    [UIView animateWithDuration:FLIP_TIME * 2.0 animations:^{
        [self.screenManager.currentScreen setAlpha:0.0];
        [self.screenManager.currentScreen setAlpha:1.0];
    }];
    [self.view addSubview:self.screenManager.currentScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end