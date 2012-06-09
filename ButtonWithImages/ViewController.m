//
//  ViewController.m
//  ButtonWithImages
//
//  Created by James Border on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(void)addButton:(NSString*)title withRect:(CGRect)buttonRect;
-(void)targetMethod:(id)sender;

@end

@implementation ViewController

-(void)addButton:(NSString*)title withRect:(CGRect)buttonRect {
	
	UIImage *bttnImageNormal = [UIImage imageNamed:@"ButtonBackground-Normal.png"];
	UIImage *bttnImageHighlighted = [UIImage imageNamed:@"ButtonBackground-Highlighted.png"];
	UIImage *bttnImageSelected = [UIImage imageNamed:@"ButtonBackground-Selected.png"];
	
	UIButton *bttn = [UIButton buttonWithType:UIButtonTypeCustom];
	[bttn setFrame:buttonRect];
	[bttn setTitle:title forState:UIControlStateNormal];
	[bttn setBackgroundImage:bttnImageNormal forState:UIControlStateNormal];
	[bttn setBackgroundImage:bttnImageHighlighted forState:UIControlStateHighlighted];
	[bttn setBackgroundImage:bttnImageSelected forState:UIControlStateSelected];
	[bttn addTarget:self action:@selector(targetMethod:) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:bttn];
	
}

-(void)targetMethod:(id)sender {
	
	if ([[self.view subviews] count] > 0) {
		
		for (UIButton *subView in [self.view subviews]) {
			
			if ([subView respondsToSelector:@selector(setSelected:)]) {
				[subView setSelected:NO];
			}
			
		}
		
	}
	
	[sender setSelected:YES];
	
}

#pragma mark - View lifecycle

- (void)viewDidLoad {

    [super viewDidLoad];

	[self addButton:@"American" withRect:CGRectMake(40, 100, 230, 50)];
	[self addButton:@"Swiss" withRect:CGRectMake(40, 200, 230, 50)];
	[self addButton:@"Cheddar" withRect:CGRectMake(40, 300, 230, 50)];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
