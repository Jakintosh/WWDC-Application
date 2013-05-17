//
//  Screen.m
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import "Screen.h"

@implementation Screen

-(NSMutableArray*)textData
{
    if(!_textData){
        _textData = [[NSMutableArray alloc] init];
    }
    return _textData;
}

-(NSMutableArray*)gridData
{
    if(!_gridData){
        _gridData = [[NSMutableArray alloc] init];
    }
    return _gridData;
}

-(void)addTextDataWithText:(NSString*)text frame:(CGRect)frame size:(int)size
{
    [self.textData addObject:[[TextData alloc] initWithText:text frame:frame size:size]];
}

-(void)addGridDataAt:(CGRect)frame
{
    [self.gridData addObject:[NSValue valueWithCGRect:frame]];
}

-(NSArray*)getGrid
{
    return [self.gridData copy];
}

@end