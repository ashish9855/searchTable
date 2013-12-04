//
//  iTableView.h
//  searchTable
//
//  Created by ADMIN on 12/3/13.
//  Copyright (c) 2013 Individual. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iGetData.h"
#import "iViewController.h"


@interface iTableView : NSObject<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate,UISearchBarDelegate>

{
    iGetData *getData;
    NSMutableArray *filteredResults;
    
    // BOOL to get if searching
    BOOL isSearching;
}

-(void)filterListForSearchText:(NSString *)searchText;

@property(strong,retain)NSArray *getDataCopy;
@property(strong,retain)UITableView *showTableView;

@end
