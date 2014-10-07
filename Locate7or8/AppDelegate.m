//
//  AppDelegate.m
//
//  Created by Mark Edington on 10/6/14.
//
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [[[UIAlertView alloc] initWithTitle:@"Alert" message:notification.alertBody delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end
