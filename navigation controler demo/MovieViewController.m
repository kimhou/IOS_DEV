//
//  MovieViewController.m
//  navigation controler demo
//
//  Created by 侯 坤明 on 13-5-26.
//  Copyright (c) 2013年 kim. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieDetailViewController.h"
#import "AppDelegate.h"

@interface MovieViewController ()
@property (strong, nonatomic) MovieDetailViewController *childController;

@end

@implementation MovieViewController
@synthesize childController;
@synthesize movieList;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSArray *arr = [[NSArray alloc] initWithObjects:@"m1", @"m2", @"m3", nil];
    if(self.movieList == nil){
    self.movieList = arr;
    }
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void) viewDidUnload{
    self.movieList = nil;
    self.childController = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [movieList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MovieTableViewCell = @"MovieTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MovieTableViewCell];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MovieTableViewCell] autorelease];
    }
    NSInteger row = [indexPath row];
    NSString *movieTitle = [movieList objectAtIndex:row];
    cell.textLabel.text = movieTitle;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)dealloc {
    [super dealloc];
}
-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if(childController == nil){
        childController = [[MovieDetailViewController alloc] initWithNibName:@"MovieDetailViewController" bundle:nil];
    }
    NSInteger row = [indexPath row];
    NSString *selectedMovie = [movieList objectAtIndex:row];
    NSString *detailMessage = [[NSString alloc] initWithFormat:@"你选择了电影:%@", selectedMovie];
    childController.message = detailMessage;
    childController.title = selectedMovie;
    [self.navigationController pushViewController:childController animated:YES];
}
@end
