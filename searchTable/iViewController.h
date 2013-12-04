//
//  iViewController.h
//  searchTable
//
//  Created by ADMIN on 12/3/13.
//  Copyright (c) 2013 Individual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iTableView.h"

@interface iViewController : UIViewController

{
    
}
@property(nonatomic,retain)UITableView *showTableView;
@property(nonatomic,retain)UISearchBar *searchBar;
@property(nonatomic,retain)UISearchDisplayController *searchBarController;

@end
