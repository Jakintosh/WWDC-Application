//
//  Screen.h
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextData.h"

@interface Screen : NSObject

// public properties
@property(nonatomic, strong) NSMutableArray* textData;
@property(nonatomic, strong) NSMutableArray* gridData;

// public methods
-(void)addTextDataWithText:(NSString*)text frame:(CGRect)frame size:(int)size;
-(void)addGridDataAt:(CGRect)frame;
-(NSArray*)getGrid;

@end