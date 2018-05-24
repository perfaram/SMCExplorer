//
//  AppDelegate.m
//  DetailsView
//
//  Created by Perceval FARAMAZ on 20/10/14.
//  Copyright (c) 2014 Perceval FARAMAZ. All rights reserved.
//

#import "AppDelegate.h"
#import "DCOAboutWindow/DCOAboutWindowController.h"
//#import "smc.h"
#import "SMCSupport.h"
//#import "SMCWrapper.h"

@interface AppDelegate()

/** The window controller that handles the about window. */
@property (nonatomic, strong) DCOAboutWindowController *aboutWindowController;

@end


@implementation AppDelegate

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

//@synthesize myLabelViewController;

- (DCOAboutWindowController *)aboutWindowController {
    if(!_aboutWindowController) {
        _aboutWindowController = [[DCOAboutWindowController alloc] init];
    }
    return _aboutWindowController;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
	NSMutableDictionary* valDict;
	NSMutableDictionary* typeDict;
    NSMutableDictionary* rawDict;
	[[SMCWrapper sharedWrapper] dumpToValueDict:&valDict andTypeDict:&typeDict andRawDict:&rawDict];
    self.smcDict = valDict;
	self.smcDictTypes = typeDict;
    self.smcRawDict = rawDict;
    [_smcDict enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:key, @"Key", value, @"Value", [_smcDictTypes valueForKey:key], @"Type", [[SMCSupport alloc] keyProperty:KEY_DESC forKey:key], @"Description", nil];
        [_tableContent addObject:dictionary];
        [sillyArray addObject:dictionary];
    }];
    [stubbornTable reloadData];
    [stubbornTable setSortDescriptors:
     [NSArray arrayWithObject:
      [[NSSortDescriptor alloc] initWithKey:@"Key" ascending:YES]]];
    _didFinishLaunching=YES;
}

-(void)awakeFromNib
{
	return;
}

- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(NSInteger)rowIndex {
    return YES;
}

#pragma mark - Resizable

- (BOOL)isResizable {
    return self.aboutWindowController.window.styleMask & NSResizableWindowMask;
}

- (void)setResizable:(BOOL)resizable {
    
    if(self.isResizable) {
        self.aboutWindowController.window.styleMask &= ~NSResizableWindowMask;
    } else {
        self.aboutWindowController.window.styleMask |= NSResizableWindowMask;
    }
}

#pragma mark - Interface Methods

- (IBAction)showAboutWindow:(id)sender {
    
    // Set about window values (override defaults)
    self.aboutWindowController.appWebsiteURL = [NSURL URLWithString:@"thanks_for_testing_mate!"];
    
    // Show the about window
    [self.aboutWindowController showWindow:nil];
    
}

-(void)saveItemClicked:(id)sender {
    NSMutableDictionary<NSString*, NSDictionary*>* plistDict = [NSMutableDictionary.alloc initWithCapacity:self.smcDict.count];
    
    for (NSString* key in self.smcDict.allKeys) {
        NSDictionary* describingValue = @{@"type": [_smcDictTypes valueForKey:key],
                                          @"value": [_smcDict valueForKey:key],
                                          @"raw": [_smcRawDict valueForKey:key]
                                          };
        [plistDict setObject:describingValue forKey:key];
    }
    
    NSString *filePath = [@"~/Downloads/SMCDump.plist" stringByExpandingTildeInPath];
    [plistDict writeToFile:filePath atomically:YES];
}

@end
