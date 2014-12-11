//
//  SMCSupport.m
//  OSXRay
//
//  Created by Perceval FARAMAZ on 03/11/14.
//  Copyright (c) 2014 Perceval FARAMAZ. All rights reserved.
//

#import "SMCSupport.h"

@implementation SMCSupport
/*
-(id) init {
    self = [super init];
    if (self) {
    }
    return self;
}*/
-(NSString*) keyProperty:(KEY_PROPERTY)prop forKey:(NSString*)key {
    
    switch (prop) {
        case KEY_DESC:
            if (TRUE) {
            NSString* kType = [[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SMCDescs" ofType:@"plist"]] objectForKey:key];
            if ([kType isEqual:@""]) {
                kType = @"";
            }
                return kType;
            }
            break;
        case KEY_TYPE:
            if (true) {
            NSString *kType = [[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SMCTypes" ofType:@"plist"]] objectForKey:key];
            if ([kType isEqual:@""]) {
                kType = @"";
            }
                return kType;
            }
            break;
    }
    return @"";
}
@end
