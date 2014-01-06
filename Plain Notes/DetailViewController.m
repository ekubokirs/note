//
//  DetailViewController.m
//  Plain Notes
//
//  Created by Emilia Kirschenbaum on 12/12/13.
//  Copyright (c) 2013 Spark Networks. All rights reserved.
//

#import "DetailViewController.h"
#import "Data.h"
#import "Constants.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    NSString *currentNote = [[Data getAllNotes]objectForKey:[Data getCurrentKey]];
    if ([currentNote isEqualToString:kDefaultText]){
        self.tView.text = @"";
    }
    else{
        self.tView.text = currentNote;
    }
    [self.tView becomeFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}
-(void)viewWillDisappear:(BOOL)animated{
    if (![self.tView.text isEqualToString:@""]) {
        [Data setNoteForCurrentKey:self.tView.text];
    }
    else{
        [Data removeObjectForKey:[Data getCurrentKey]];
    }
    [Data saveNotes];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
