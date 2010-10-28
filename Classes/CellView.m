//
//  CellView.m
//  Matcharoo
//
//  Created by Benjamin Birnbaum on 30/09/10.
//  Copyright 2010 Wobolando. All rights reserved.
//

#import "CellView.h"
#import "MatcharooViewController.h"

@implementation CellView

@synthesize matchController, cellType, matched;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touched");
	[self.matchController touchedCell:self];
}

- (void)dealloc {
    [super dealloc];
}


@end
