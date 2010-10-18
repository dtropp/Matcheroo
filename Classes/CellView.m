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

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touched");
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, 200, 450, 50)];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont systemFontOfSize:72];
	label.text = @"touched";
	[self addSubview:label];
	[label release];
	[self.matchController touchedCell:self];
}

- (void)dealloc {
    [super dealloc];
}


@end
