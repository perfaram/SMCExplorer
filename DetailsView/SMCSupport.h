//
//  SMCSupport.h
//  OSXRay
//
//  Created by Perceval FARAMAZ on 03/11/14.
//  Copyright (c) 2014 Perceval FARAMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum KEY_PROPERTY{
    KEY_DESC=1,
    KEY_TYPE=2
}KEY_PROPERTY;
@interface SMCSupport : NSObject
//-(id)init;
-(NSString*) keyProperty:(KEY_PROPERTY)prop forKey:(NSString*)key;
@end
