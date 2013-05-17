//
//  GridManager.m
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import "GridManager.h"

@implementation GridManager

-(NSMutableArray*)grid
{
    if (!_grid){
        _grid = [[NSMutableArray alloc] init];
    }
    return _grid;
}

-(NSMutableArray*)newGrid
{
    if (!_newGrid){
        _newGrid = [[NSMutableArray alloc] init];
    }
    return _newGrid;
}

-(UIView*)view
{
    if (!_view){
        _view = [[UIView alloc] init];
    }
    return _view;
}

-(id)init
{
    if (self = [super init])
    {
        [self initializeGrid];
    }
    
    return self;
}

-(float)loadNewScreen:(NSArray*)gridCoords
{
    //  reset new grid
    [self resetSelections];
    
    //  set values in new grid
    for (NSValue* rect in gridCoords)
    {
        CGRect tempRect = [rect CGRectValue];
        [self setButtonsSelectedWithX:tempRect.origin.x Y:tempRect.origin.y W:tempRect.size.width H:tempRect.size.height];
    }
    
    //  switch all grid pieces to new grid pieces and return delay
    return [self swapGrids];

}

-(float)swapGrids
{
    int x = 0;
    int y = 0;
    float timer = 0.0f;
    
    for (int i = 0; i < GRID_W; i++)
    {
        x = i;
        y = 0;
        for (int j = i; j >= 0; j--)
        {
            [self performSelector:@selector(flipToSelectedWithCoords:) withObject:[NSValue valueWithCGPoint:CGPointMake(x, y)] afterDelay:timer];
            x--;
            y++;
        }
        timer += .05;
    }
    
    for (int i = 1; i < GRID_H - GRID_W; i++)
    {
        x = GRID_W - 1;
        y = i;
        for (int j = GRID_W - 1; j >= 0; j--)
        {
            [self performSelector:@selector(flipToSelectedWithCoords:) withObject:[NSValue valueWithCGPoint:CGPointMake(x, y)] afterDelay:timer];
            x--;
            y++;
        }
        timer += .05;
    }
    
    for (int i = GRID_H - GRID_W; i < GRID_H; i++)
    {
        x = GRID_W - 1;
        y = i;
        for (int j = i; j < GRID_H; j++)
        {
            [self performSelector:@selector(flipToSelectedWithCoords:) withObject:[NSValue valueWithCGPoint:CGPointMake(x, y)] afterDelay:timer];
            x--;
            y++;
        }
        timer += .05;
    }
    return timer;
}

-(void)setButtonsSelectedWithX:(int)x Y:(int)y W:(int)w H:(int)h
{
    for (int i = 0; i < h; i++)
    {
        for (int j = 0; j < w; j++)
        {
            [[[self.newGrid objectAtIndex:i+y] objectAtIndex:j+x] setSelected:YES];
        }
    }
}

-(void)resetSelections
{

    for (int i = 0; i < [self.newGrid count]; i++)
    {
        for (int j = 0; j < [[self.newGrid objectAtIndex:i] count]; j++)
        {
            [[[self.newGrid objectAtIndex:i] objectAtIndex:j] setSelected:NO];
        }
    }
}

-(void)flipToSelectedWithCoords:(NSValue*)coords
{
    CGPoint pos = coords.CGPointValue;
    UIButton* button = [[self.grid objectAtIndex:pos.y] objectAtIndex:pos.x];
    UIButton* newButton = [[self.newGrid objectAtIndex:pos.y] objectAtIndex:pos.x];
    [UIView transitionWithView:button
                      duration:FLIP_TIME
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    animations:^{
                        [button removeFromSuperview];
                        [button setSelected:newButton.selected];
                        [self.view addSubview:button];}
                    completion:NULL];
}

-(void)initializeGrid
{
    for (int i = 0; i < GRID_H; i++)
    {
        NSMutableArray* row = [[NSMutableArray alloc] init];
        NSMutableArray* newRow = [[NSMutableArray alloc] init];
        
        for (int j = 0; j < GRID_W; j++)
        {
            UIButton *tempUnit = [self initializeUnit];
            tempUnit.frame = CGRectMake( (j * GRID_SIZE_W), (i * GRID_SIZE_H), GRID_SIZE_W, GRID_SIZE_H);
            [row addObject:tempUnit];
            [self.view addSubview:tempUnit];
            
            UIButton *newUnit = [self initializeUnit];
            tempUnit.frame = CGRectMake( (j * GRID_SIZE_W), (i * GRID_SIZE_H), GRID_SIZE_W, GRID_SIZE_H);
            [newRow addObject:newUnit];
        }
        
        [self.grid addObject:row];
        [self.newGrid addObject:newRow];
    }
}

-(UIButton*)initializeUnit
{
    UIButton* tempUnit = [[UIButton alloc] init];
    
    // Set state images
    [tempUnit setBackgroundImage:[UIImage imageNamed:@"grid_default_40"] forState:UIControlStateNormal];
    [tempUnit setBackgroundImage:[UIImage imageNamed:@"grid_flipped_40"] forState:UIControlStateSelected];
    
    return tempUnit;
}

@end