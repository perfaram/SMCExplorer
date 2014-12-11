//
//  AppDelegate.h
//  DetailsView
//
//  Created by Perceval FARAMAZ on 20/10/14.
//  Copyright (c) 2014 Perceval FARAMAZ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "smc.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSToolbarDelegate, NSTableViewDelegate>{
	IBOutlet NSWindow *window;
	IBOutlet NSArrayController* sillyArray;
	IBOutlet NSTableView* stubbornTable;
}
/** Returns and sets whether the about window is resiable. */
@property (nonatomic, assign, getter = isResizable) BOOL resizable;
- (IBAction)showAboutWindow:(id)sender;
@property BOOL didFinishLaunching;

@property NSDictionary *smcDict;
@property NSDictionary *smcDictTypes;
//@property NSMutableArray *smcKeys;
//@property NSMutableArray *smcValues;
@property NSMutableArray *tableContent;
@property NSMutableArray *kextTable;

@end
