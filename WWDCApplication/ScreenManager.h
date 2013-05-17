//
//  ScreenManager.h
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Screen.h"

@interface ScreenManager : NSObject

// public properties
@property(nonatomic, strong) NSMutableDictionary* screens;
@property(nonatomic, strong) UIView* currentScreen;

// public methods
-(id)init;
-(void)changeScreen:(NSString*)screen;
-(void)loadCurrentScreenToView;
-(NSArray*)getCurrentGrid;

@end