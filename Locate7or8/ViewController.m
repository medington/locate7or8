//
//  ViewController.m
//
//  Created by Mark Edington on 10/6/14.
//
//

#import "ViewController.h"
#import "LocationHandler.h"

@implementation ViewController

- (IBAction)startTracking:(id)sender {
    [[LocationHandler sharedManager] startLocationServices];
}

@end
