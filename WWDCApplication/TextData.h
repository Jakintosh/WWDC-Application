//
//  TextData.h
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextData : NSObject

@property(nonatomic, strong) NSString* text;
@property(nonatomic) CGRect frame;
@property(nonatomic) int size;

-(id)initWithText:(NSString*)text frame:(CGRect)frame size:(int)size;

@end