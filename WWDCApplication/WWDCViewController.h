//
//  WWDCViewController.h
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridManager.h"
#import "ScreenManager.h"
#import "OBShapedButton/OBShapedButton.h"

@interface WWDCViewController : UIViewController

// public properties
@property(nonatomic, strong) GridManager* gridManager;
@property(nonatomic, strong) ScreenManager* screenManager;
//@property(nonatomic, strong) UIView* secondaryControls;
//@property(nonatomic, strong) OBShapedButton* switcherRef;
//@property(nonatomic) BOOL controlsVisible;

@end