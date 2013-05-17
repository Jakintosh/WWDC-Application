//
//  GridManager.h
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GRID_W 16
#define GRID_H 28
#define GRID_SIZE_W 20
#define GRID_SIZE_H 20
#define FLIP_TIME 0.5

@interface GridManager : NSObject

@property(nonatomic, strong) UIView* view;
@property(nonatomic, strong) NSMutableArray* grid;
@property(nonatomic, strong) NSMutableArray* newGrid;

-(float)loadNewScreen:(NSArray*)gridCoords;

@end
