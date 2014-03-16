//
//  detailViewController.m
//  Quiz5
//
//  Created by Krystle on 3/14/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "detailViewController.h"
#import "Tasks.h"


@implementation detailViewController
@synthesize task;


- (IBAction)slider:(id)sender {
    [urgency setText: [NSString stringWithFormat:@ "%f", slider.value]];
}

- (IBAction)saveFields:(id)sender {
    [[self view] endEditing:YES];
    [task setUrgency:[[urgency text]intValue] ];
    [task setName:[name text]];
    [task setDueDate:[datePicker date]];
     }

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [urgency setText:[NSString stringWithFormat:@ "%d", [task urgency]]];
    slider.maximumValue = 9;
    slider.minimumValue = 0;
    [datePicker setDate:[task dueDate]];
    [name setText:[task name]];
    
    
}
-(void)viewWillDisappear:(BOOL)animated {
    
      [[self view] endEditing:YES];
    
    [super viewWillDisappear:animated];
    [task setUrgency:[[urgency text]intValue] ];
    [task setName:[name text]];
    [task setDueDate:[datePicker date]];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
