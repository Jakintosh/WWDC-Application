//
//  ScreenManager.m
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import "ScreenManager.h"

@interface ScreenManager()
@property(nonatomic, strong) NSString* currentScreenTag;
@end

@implementation ScreenManager

// lazy getters--------------------------
-(NSMutableDictionary*)screens {
    if(!_screens){
        _screens = [[NSMutableDictionary alloc] init];
    }
    return _screens;
}
-(NSString*)currentScreenTag {
    if(!_currentScreenTag){
        _currentScreenTag = [[NSString alloc] init];
    }
    return _currentScreenTag;
}
-(UIView*)currentScreen {
    if(!_currentScreen) {
        _currentScreen = [[UIView alloc] init];
    }
    return _currentScreen;
}
// --------------------------------------

-(id)init
{
    if(self = [super init])
    {
        // I can do data driven, but not really seeing the point here for such a small app/time limit
        
        // init screens
        [self.screens setObject:[[Screen alloc] init] forKey:@"Projects"];
        [self.screens setObject:[[Screen alloc] init] forKey:@"Education"];
        [self.screens setObject:[[Screen alloc] init] forKey:@"Skills"];
        [self.screens setObject:[[Screen alloc] init] forKey:@"Interests"];
        
        // set text for Projects Screen
        [[self.screens objectForKey:@"Projects"] addTextDataWithText:@"Projects" frame:CGRectMake(48, 40, 140, 20) size:17];
        [[self.screens objectForKey:@"Projects"] addTextDataWithText:@"*see jaktiano.com" frame:CGRectMake(168, 40, 140, 20) size:11];
        [[self.screens objectForKey:@"Projects"] addTextDataWithText:@"-Now iSee It, 2010" frame:CGRectMake(48, 80, 140, 20) size:15];
        [[self.screens objectForKey:@"Projects"] addTextDataWithText:@"My first iOS application, developed from zero previous knowledge of Objective-C. Functions as a magnifiying glass." frame:CGRectMake(64, 100, 192, 80) size:13];
        [[self.screens objectForKey:@"Projects"] addTextDataWithText:@"-Extreme Fly Fishing, 2013*" frame:CGRectMake(48, 200, 200, 20) size:15];
        [[self.screens objectForKey:@"Projects"] addTextDataWithText:@"An endless style game made with Adobe AIR for iOS and Android. I designed, produced, and composed for this project." frame:CGRectMake(64, 220, 192, 80) size:13];
        [[self.screens objectForKey:@"Projects"] addTextDataWithText:@"-Time Tanks, 2013*" frame:CGRectMake(48, 320, 140, 20) size:15];
        [[self.screens objectForKey:@"Projects"] addTextDataWithText:@"A tank game with a time-warp twist, written in SDL. It was a six-week project, and I co-programed it with one other person." frame:CGRectMake(64, 340, 192, 80) size:13];
        
        
        // set text for Education Screen
        [[self.screens objectForKey:@"Education"] addTextDataWithText:@"Education" frame:CGRectMake(52, 40, 140, 20) size:17];
        [[self.screens objectForKey:@"Education"] addTextDataWithText:@"-Champlain College, 2011-present" frame:CGRectMake(43, 80, 220, 20) size:14];
        [[self.screens objectForKey:@"Education"] addTextDataWithText:@"Majoring in Game Design w/ minor in Game Programming. 3.94 Overall GPA after four semesters, with two 4.0 semesters." frame:CGRectMake(64, 100, 192, 60) size:12];
        [[self.screens objectForKey:@"Education"] addTextDataWithText:@"-Brookdale College, 2009-2011" frame:CGRectMake(43, 200, 200, 20) size:14];
        [[self.screens objectForKey:@"Education"] addTextDataWithText:@"Took one programming class a semester while still in high school. Subjects included Intro to C++ and Object Oriented Programming." frame:CGRectMake(64, 220, 192, 60) size:12];
        [[self.screens objectForKey:@"Education"] addTextDataWithText:@"-High Technology HS, 2007-2011" frame:CGRectMake(43, 320, 220, 20) size:14];
        [[self.screens objectForKey:@"Education"] addTextDataWithText:@"Attended a pre-engineering high school that is consistently ranked amoing the top STEM schools in the country." frame:CGRectMake(64, 340, 192, 60) size:12];
        
        // set text for Skills Screen
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"Skills" frame:CGRectMake(50, 40, 140, 20) size:17];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"Programming" frame:CGRectMake(45, 80, 140, 20) size:15];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• Visual Studio, Xcode" frame:CGRectMake(65, 102, 140, 20) size:13];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• C++, C#" frame:CGRectMake(65, 120, 140, 20) size:13];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• Objective-C" frame:CGRectMake(65, 138, 140, 20) size:13];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"Game Development" frame:CGRectMake(45, 180, 140, 20) size:15];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• Game, Level Design" frame:CGRectMake(65, 203, 140, 20) size:13];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• Basic 3D Art" frame:CGRectMake(65, 221, 140, 20) size:13];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• Flash, UDK" frame:CGRectMake(65, 239, 140, 20) size:13];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• Production, Scrum" frame:CGRectMake(65, 257, 140, 20) size:13];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"Other" frame:CGRectMake(50, 300, 140, 20) size:15];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• Music Production" frame:CGRectMake(65, 322, 140, 20) size:13];
        [[self.screens objectForKey:@"Skills"] addTextDataWithText:@"• Garageband" frame:CGRectMake(65, 338, 140, 20) size:13];
        
        // set text for Interests Screen
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"Interests" frame:CGRectMake(47, 40, 140, 20) size:17];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"Applications of interactive" frame:CGRectMake(105, 80, 200, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"media" frame:CGRectMake(233, 98, 50, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"Coding" frame:CGRectMake(45, 140, 60, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"as" frame:CGRectMake(102, 160, 20, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"a" frame:CGRectMake(125, 140, 20, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"creative" frame:CGRectMake(144, 160, 60, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"tool" frame:CGRectMake(207, 140, 40, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"Collecting and" frame:CGRectMake(103, 220, 100, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"listening to" frame:CGRectMake(123, 240, 80, 20) size:15];
        [[self.screens objectForKey:@"Interests"] addTextDataWithText:@"vinyl records" frame:CGRectMake(123, 260, 100, 20) size:15];
        
        
        // set grid for Projects Screen
        [[self.screens objectForKey:@"Projects"] addGridDataAt:CGRectMake(2, 2, 4, 1)];
        [[self.screens objectForKey:@"Projects"] addGridDataAt:CGRectMake(8, 2, 5, 1)];
        [[self.screens objectForKey:@"Projects"] addGridDataAt:CGRectMake(2, 4, 7, 1)];
        [[self.screens objectForKey:@"Projects"] addGridDataAt:CGRectMake(3, 5, 10, 4)];
        [[self.screens objectForKey:@"Projects"] addGridDataAt:CGRectMake(2, 10, 10, 1)];
        [[self.screens objectForKey:@"Projects"] addGridDataAt:CGRectMake(3, 11, 10, 4)];
        [[self.screens objectForKey:@"Projects"] addGridDataAt:CGRectMake(2, 16, 7, 1)];
        [[self.screens objectForKey:@"Projects"] addGridDataAt:CGRectMake(3, 17, 10, 4)];
        
        // set grid for Education Screen
        [[self.screens objectForKey:@"Education"] addGridDataAt:CGRectMake(2, 2, 5, 1)];
        [[self.screens objectForKey:@"Education"] addGridDataAt:CGRectMake(2, 4, 11, 1)];
        [[self.screens objectForKey:@"Education"] addGridDataAt:CGRectMake(3, 5, 10, 3)];
        [[self.screens objectForKey:@"Education"] addGridDataAt:CGRectMake(2, 10, 10, 1)];
        [[self.screens objectForKey:@"Education"] addGridDataAt:CGRectMake(3, 11, 10, 3)];
        [[self.screens objectForKey:@"Education"] addGridDataAt:CGRectMake(2, 16, 11, 1)];
        [[self.screens objectForKey:@"Education"] addGridDataAt:CGRectMake(3, 17, 10, 3)];
        
        // set grid for Skills Screen
        [[self.screens objectForKey:@"Skills"] addGridDataAt:CGRectMake(2, 2, 3, 1)];
        [[self.screens objectForKey:@"Skills"] addGridDataAt:CGRectMake(2, 4, 5, 1)];
        [[self.screens objectForKey:@"Skills"] addGridDataAt:CGRectMake(3, 5, 7, 3)];
        [[self.screens objectForKey:@"Skills"] addGridDataAt:CGRectMake(2, 9, 7, 1)];
        [[self.screens objectForKey:@"Skills"] addGridDataAt:CGRectMake(3, 10, 7, 4)];
        [[self.screens objectForKey:@"Skills"] addGridDataAt:CGRectMake(2, 15, 3, 1)];
        [[self.screens objectForKey:@"Skills"] addGridDataAt:CGRectMake(3, 16, 7, 2)];
        
        // set grid for Interests Screen
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(2, 2, 4, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(5, 4, 9, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(11, 5, 3, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(2, 7, 3, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(5, 8, 1, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(6, 7, 1, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(7, 8, 3, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(10, 7, 2, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(5, 11, 5, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(6, 12, 4, 1)];
        [[self.screens objectForKey:@"Interests"] addGridDataAt:CGRectMake(6
                                                                           , 13, 5, 1)];
    }

    return self;
}

-(void)loadCurrentScreenToView
{
    // clear current view
    [self clearCurrentScreen];
    
    // get data for current screen
    Screen* currentScreenData = [self.screens objectForKey:self.currentScreenTag];
    
    // create labels for each thing
    for (TextData* text in currentScreenData.textData)
    {
        UILabel* tempData = [[UILabel alloc] init];
        tempData.lineBreakMode = NSLineBreakByWordWrapping;
        tempData.numberOfLines = 0;
        tempData.font = [UIFont fontWithName:@"Helvetica" size:text.size];
        [tempData setBackgroundColor:[UIColor clearColor]];
        [tempData setFrame:text.frame];
        [tempData setText:text.text];
        [tempData setTextColor:[UIColor blackColor]];
        [self.currentScreen addSubview:tempData];
    }
}

-(NSArray*)getCurrentGrid
{
    return [[self.screens objectForKey:self.currentScreenTag] getGrid];
}

-(void)clearCurrentScreen
{
    [self.currentScreen.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

-(void)changeScreen:(NSString*)screen
{
    self.currentScreenTag = screen;
}

@end