//
//  Quiz5ViewController.m
//  Quiz5
//
//  Created by Krystle on 3/14/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "Quiz5ViewController.h"
#import "Tasks.h"
#import "detailViewController.h"

@interface Quiz5ViewController ()

@end

@implementation Quiz5ViewController


-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UINavigationItem *n =[self navigationItem];
        [n setTitle:@"My Tasks"];
        
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        ////// making the tasks///////////////////
        allTasks = [[NSMutableArray alloc]init];
      
        for (int i =0; i<10; i++){
            
             _task = [[Tasks alloc]init];
            _task.urgency = i;
           
            _task.name = [NSString stringWithFormat:@ "Task %d", i];
            _task.dueDate = [NSDate dateWithTimeIntervalSinceNow:i*(60*60*24)];
          
                [allTasks addObject:_task];
           }
        ///////////////////////////////////////////////
        
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
    Tasks *t = [allTasks objectAtIndex:[ip row]];
    
    detailViewController *dvc = [segue destinationViewController];
    [dvc setTask: t];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [allTasks count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@ "cell"];
    //If there is no cell create one
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@ "cell"];
    }

    Tasks *task = [allTasks objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[task name]];
    
    ////////////// image for cell with urgency 6 or over
    
    UIImage *image = [UIImage imageNamed: @"urgent.jpg" ];
    if (task.urgency > 6){
        [cell.imageView setImage:image];
   }else { cell.imageView.image = nil;}
    
    ///date
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateStyle:NSDateFormatterLongStyle];
    [[cell detailTextLabel] setText:[df stringFromDate:task.dueDate]];
    ////////// color for the cells
    [cell setBackgroundColor:[UIColor colorWithRed:task.urgency/10.0 green:1.0-(task.urgency/10.4) blue:0 alpha:0.5]];
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    
    return cell;
    

}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [allTasks sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Tasks *t1 = obj1;
        Tasks *t2 = obj2;
        return [t1.dueDate compare:t2.dueDate];
    }];
    [[self tableView] reloadData];
}


@end
