//
//  TextData.m
//  WWDCApplication
//
//  Created by Jak Tiano on 4/25/13.
//  Copyright (c) 2013 Jak Tiano. All rights reserved.
//

#import "TextData.h"

@implementation TextData
@synthesize text = _text;

-(NSString*)text {
    if(!_text) {
        _text = [[NSString alloc] init];
    }
    
    return _text;
}
-(void)setText:(NSString *)text {
    if(!_text) {
        _text = [[NSString alloc] init];
    }
    
    _text = text;
}

-(id)initWithText:(NSString*)text frame:(CGRect)frame size:(int)size
{
    if (self = [super init])
    {
        self.text = text;
        self.frame = frame;
        self.size = size;
    }
    return self;
}

@end