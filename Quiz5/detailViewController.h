//
//  detailViewController.h
//  Quiz5
//
//  Created by Krystle on 3/14/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Tasks;
@interface detailViewController : UIViewController <UITextFieldDelegate>{
    
    __weak IBOutlet UISlider *slider;
    __weak IBOutlet UILabel *urgency;
    __weak IBOutlet UIDatePicker *datePicker;
    __weak IBOutlet UITextField *name;
}
@property (nonatomic)Tasks *task;
- (IBAction)slider:(id)sender;
- (IBAction)saveFields:(id)sender;


@end
