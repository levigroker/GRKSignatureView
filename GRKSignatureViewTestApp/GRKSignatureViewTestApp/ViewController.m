//
//  ViewController.m
//  GRKSignatureViewTestApp
//
//  Created by Levi Brown on 9/29/17.
//  Copyright © 2017 Levi Brown. All rights reserved.
//

#import "ViewController.h"
#import <GRKSignatureView/GRKSignatureView.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet GRKSignatureView *signatureView;
@property (nonatomic, weak) IBOutlet UISwitch *longPressSwitch;
@property (nonatomic, weak) IBOutlet UIView *imageContainerView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

- (IBAction)clearAction:(id)sender;
- (IBAction)longPressValueChanged:(id)sender;
- (IBAction)imageTapGesture:(UITapGestureRecognizer *)tap;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.imageContainerView.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	self.longPressSwitch.on = self.signatureView.eraseOnLongPress;
}

#pragma mark - Actions

- (IBAction)clearAction:(id)sender
{
	NSLog(@"clearAction:");
	[self.signatureView erase];
}

- (IBAction)snapshotAction:(id)sender
{
	NSLog(@"snapshotAction:");
	UIImage *signature = [self.signatureView signatureImageWithColor:[UIColor redColor]];
	self.imageView.image = signature;
	self.imageContainerView.hidden = NO;
}

- (IBAction)longPressValueChanged:(UISwitch *)sender
{
	NSLog(@"longPressValueChanged:");
	self.signatureView.eraseOnLongPress = sender.on;
}

- (IBAction)imageTapGesture:(UITapGestureRecognizer *)tap
{
	NSLog(@"Image Tap");
	self.imageContainerView.hidden = YES;
}

@end
