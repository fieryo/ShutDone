//
//  ShutDoneAppDelegate.m
//  ShutDone
//
//  Created by user on 05.06.16.
//  Copyright 2016 O.Ivanov. All rights reserved.
//

#import "ShutDoneAppDelegate.h"

@implementation ShutDoneAppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	NSNotificationCenter *center = [[NSWorkspace sharedWorkspace] notificationCenter];
	[center addObserver:self selector:@selector(appLaunched:) name:NSWorkspaceDidLaunchApplicationNotification object:nil];
	//[center addObserver:self selector:@selector(appTerminated:) name:NSWorkspaceDidTerminateApplicationNotification object:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification
{
	if(aNotification){
		NSNotificationCenter *center = [[NSWorkspace sharedWorkspace] notificationCenter];
		[center removeObserver:self name:NSWorkspaceDidLaunchApplicationNotification object:nil];
		//[center removeObserver:self name:NSWorkspaceDidTerminateApplicationNotification object:nil];			
	}
}

- (void)appLaunched:(NSNotification *)note {
	if ( [[[note userInfo] objectForKey:@"NSApplicationBundleIdentifier"] isEqualToString:@"com.presenta.iGetter"] ) {
		NSDictionary* errorDict;
		NSAppleEventDescriptor* returnDescriptor = NULL;
		NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource:@"\n\
		tell application \"System Events\"\n\
		tell process \"iGetter\"\n\
		activate\n\
		set sdwdMenuItem to menu item 7 of menu 1 of menu bar item 6 of menu bar 1\n\
		repeat until (enabled of sdwdMenuItem)\n\
		end repeat\n\
		set vcheck to value of attribute \"AXMenuItemMarkChar\" of sdwdMenuItem\n\
		try\n\
		set scheck to vcheck as string\n\
		if vcheck is missing value then\n\
		set scheck to \"\"\n\
		end if\n\
		on error\n\
		set scheck to \"\"\n\
		end try\n\
		if (scheck is \"\") then\n\
		click sdwdMenuItem\n\
		end if\n\
		end tell\n\
		end tell"];
	
		returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
		
		BOOL bError = FALSE;
		if (returnDescriptor != NULL)
		{
			// successful execution
			if (kAENullEvent != [returnDescriptor descriptorType])
			{
				
			}
			else bError = TRUE;
		}
		else bError = TRUE;
		if(bError)
		{
			if(errorDict && [errorDict isKindOfClass:[NSDictionary class]] && [errorDict count] > 0)
				NSLog(@"ShutDone error: %@", errorDict);
			else NSLog(@"Cannot execute AppleScript.");
		}
		[scriptObject release];
		scriptObject = nil;
	}
}

- (void)appTerminated:(NSNotification *)note {
	if ( [[[note userInfo] objectForKey:@"NSApplicationBundleIdentifier"] isEqualToString:@"com.presenta.iGetter"] ) {
	}
}
@end
