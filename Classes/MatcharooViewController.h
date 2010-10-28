//
//  MatcharooViewController.h
//  Matcharoo
//
//  Created by Benjamin Birnbaum on 30/09/10.
//  Copyright 2010 Wobolando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import "CellView.h"

@interface MatcharooViewController : UIViewController {
	CellView *topLeft;
	CellView *topRight;
	CellView *bottomLeft;
	CellView *bottomRight;
	CellView *firstCell;
	NSArray *cells;
	
	SystemSoundID soundFileObject;
	CFURLRef soundFileURLRef;
}

@property(nonatomic, retain) IBOutlet CellView *topLeft;
@property(nonatomic, retain) IBOutlet CellView *topRight;
@property(nonatomic, retain) IBOutlet CellView *bottomLeft;
@property(nonatomic, retain) IBOutlet CellView *bottomRight;
@property(nonatomic, retain) CellView *firstCell;
@property(nonatomic, retain) NSArray *cells;

@property (nonatomic, readwrite) CFURLRef soundFileURLRef;
@property (readonly) SystemSoundID soundFileObject;

-(void) touchedCell:(CellView *) cell;

@end

