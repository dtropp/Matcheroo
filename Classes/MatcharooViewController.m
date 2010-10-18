//
//  MatcharooViewController.m
//  Matcharoo
//
//  Created by Benjamin Birnbaum on 30/09/10.
//  Copyright 2010 Wobolando. All rights reserved.
//

#import "MatcharooViewController.h"

@implementation MatcharooViewController

@synthesize topLeft, topRight, bottomLeft, bottomRight, firstCell, cells;


// Set cell colours again
- (void)resetCells {
	topLeft.backgroundColor = [UIColor blueColor];
	topLeft.cellType = @"blue";
	topRight.backgroundColor = [UIColor redColor];
	topRight.cellType = @"red";
	bottomLeft.backgroundColor = [UIColor redColor];
	bottomLeft.cellType = @"red";
	bottomRight.backgroundColor = [UIColor blueColor];
	bottomRight.cellType = @"blue";
	
	for (CellView *cell in self.cells) {
		NSLog([NSString stringWithFormat:@"cell has matched = %d", cell.matched]);
		for (UIView *view in cell.subviews) {
			NSLog(@"removing cell");
			[view removeFromSuperview];
		}
		cell.matched = FALSE;
	}
}

-(void) touchedCell : (CellView *) touchedCell {
	NSLog(@"matcharoo knows cell touched with colour");
	if (firstCell == nil) {
		NSLog(@"new cell");
		self.firstCell = touchedCell;
	} else if (firstCell.cellType == touchedCell.cellType && firstCell != touchedCell) {
		NSLog(@"colour matches");
		self.firstCell.backgroundColor = [UIColor grayColor];
		self.firstCell.matched = TRUE;
		touchedCell.backgroundColor = [UIColor grayColor];
		touchedCell.matched = TRUE;
		self.firstCell = nil;
	} else {
		NSLog(@"no match");
		self.firstCell = touchedCell;
	}	
	
	BOOL allMatched = TRUE;
	for (CellView *cell in self.cells) {
		NSLog([NSString stringWithFormat:@"cell has matched = %d", cell.matched]);
		if (!cell.matched) {
			allMatched = FALSE;
			break;
		}
	}

	NSLog([NSString stringWithFormat:@"all matched = %d", allMatched]);
	
	if (allMatched) {
		NSLog(@"all matched!");
		[self resetCells];
	}
	
}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.cells = [NSArray arrayWithObjects:topLeft, topRight, bottomLeft, bottomRight, nil];
	for (CellView *cell in self.cells) {
		cell.matchController = self;
	}
	[self resetCells];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
