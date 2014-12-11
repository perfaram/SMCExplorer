//
//  SMCWrapper.m
//  SMCInfo
//
//  Created by Fergus Morrow on 27/09/2014, based on work by Apple Corp.
//  Portions Copyright (C) 2006 devnull
//  Portions Copyright (C) 2012 Alex Leigh
//  Portions Copyright (C) 2013 Michael Wilber
//  Portions Copyright (C) 2013 Jedda Wignall
//  Portions Copyright (C) 2014 Perceval Faramaz
//  Portions Copyright (C) 2014 Naoya Sato
//  Licensed under the GNU General Public License.

#import <stdio.h>
#import <string.h>
#import <IOKit/IOKitLib.h>
#import <Foundation/Foundation.h>
#import "smc.h"

@interface SMCWrapper : NSObject

+(SMCWrapper *)sharedWrapper; //use this to get an instance of SMCWrapper

-(BOOL) readKey:(NSString *)key intoNumber:(NSNumber **)value;
-(BOOL) readKey:(NSString *)key asString:(NSString **)str;
-(SMCDump) dump;
-(id) init;
-(void) dealloc;
@end
