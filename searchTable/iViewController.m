//
//  iViewController.m
//  searchTable
//
//  Created by ADMIN on 12/3/13.
//  Copyright (c) 2013 Individual. All rights reserved.
//

#import "iViewController.h"

@interface iViewController ()

@end

@implementation iViewController

@synthesize searchBar,searchBarController;

iTableView *tabDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // object alloc
    tabDelegate=[[iTableView alloc]init];
    
    // create tableViews and search
    [self createSearch];
    [self createTableView];

}

#pragma mark --Create Search Bar

-(void)createSearch{
    
    // alloc search bar
    self.searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 320, 60)];
    self.searchBarController=[[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    [self.searchBar setDelegate:tabDelegate];
    [self.searchBarController setDelegate:tabDelegate];
    self.searchBarController.searchResultsDelegate = tabDelegate;
    self.searchBarController.searchResultsDataSource = tabDelegate;
    [self.view addSubview:self.searchBar];
}

#pragma mark --Create TableView

-(void)createTableView{
    
    // get screen size
    CGRect screenRect=[[UIScreen mainScreen]bounds];
    
    // alloc tableView
    self.showTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 124, 320,((screenRect.size.height)-157)) style:UITableViewStylePlain];
    
    [self.showTableView setDelegate:tabDelegate];
    [self.showTableView setDataSource:tabDelegate];
    
    // set delegate and datasource
    [self.view addSubview:self.showTableView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
