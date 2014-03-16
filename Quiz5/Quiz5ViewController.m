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
        NSDate *today = [NSDate date];
        NSTimeInterval *timeIntervalInsec = 86400;
        for (int i =0; i<9; i++){
            int randomUrgency = arc4random() % 9;
            today = [NSDate dateWithTimeIntervalSinceNow:*timeIntervalInsec];
            _task = [[Tasks alloc]init];
            _task.name = [NSString stringWithFormat:@ "Task %d", i];
            _task.dueDate = today;
            _task.urgency = randomUrgency;
                [allTasks addObject:_task];
            timeIntervalInsec = timeIntervalInsec + 86400;
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
    
    UIImage *image = [UIImage imageWithContentsOfFile:@"urgent.jpg" ];
    if (task.urgency > 6){
       cell.imageView.image;
   }else { cell.imageView.image = nil;}
    
    ////////// color for the cells
    if (task.urgency <= 0){
        [cell setBackgroundColor:[UIColor greenColor]];
    }else if (task.urgency > 0 && task.urgency <=1 ){
         [cell setBackgroundColor:[UIColor colorWithRed:0.1 green:0.9 blue:0.0 alpha:0.5]];
    }else if (task.urgency > 1 && task.urgency <=2){
        [cell setBackgroundColor:[UIColor colorWithRed:0.2 green:0.8 blue:0.0 alpha:0.5]];
    }else if (task.urgency > 2 && task.urgency <=3 ){
        [cell setBackgroundColor:[UIColor colorWithRed:0.3 green:0.7 blue:0.0 alpha:0.5]];
    }else if (task.urgency > 3 && task.urgency <=4 ){
        [cell setBackgroundColor:[UIColor colorWithRed:0.4 green:0.6 blue:0.0 alpha:0.5]];
    }else if (task.urgency > 4 && task.urgency <=5 ){
        [cell setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.0 alpha:0.5]];
    }else if (task.urgency > 5 && task.urgency <=6 ){
        [cell setBackgroundColor:[UIColor colorWithRed:0.6 green:0.4 blue:0.0 alpha:0.5]];
    }else if (task.urgency > 6 && task.urgency <=7 ){
        [cell setBackgroundColor:[UIColor colorWithRed:0.7 green:0.3 blue:0.0 alpha:0.5]];
    }else if (task.urgency > 7 && task.urgency <=8 ){
        [cell setBackgroundColor:[UIColor colorWithRed:0.8 green:0.2 blue:0.0 alpha:0.5]];
    }else if (task.urgency > 8 && task.urgency <=9 ){
        [cell setBackgroundColor:[UIColor redColor]];}
    
    return cell;
    

}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}


@end
