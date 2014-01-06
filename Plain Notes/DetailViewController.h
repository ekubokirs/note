//
//  DetailViewController.h
//  Plain Notes
//
//  Created by Emilia Kirschenbaum on 12/12/13.
//  Copyright (c) 2013 Spark Networks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextView *tView;
@end
