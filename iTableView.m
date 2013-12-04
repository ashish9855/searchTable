//
//  iTableView.m
//  searchTable
//
//  Created by ADMIN on 12/3/13.
//  Copyright (c) 2013 Individual. All rights reserved.
//

#import "iTableView.h"

@implementation iTableView

iViewController *getview;

@synthesize getDataCopy;

-(id)init{
    
    if(self=[super init]){
        
        getData=[[iGetData alloc]init];
        getDataCopy=[[NSArray alloc]initWithArray:getData.setTableData copyItems:YES];
        isSearching=NO;
        filteredResults=[[NSMutableArray alloc]init];
        getview=[[iViewController alloc]init];
     
    }
    return self;
}

#pragma mark --SearchBar search

-(void)filterListForSearchText:(NSString *)searchText{
    
    [filteredResults removeAllObjects];
    for (NSString *title in getDataCopy) {
        
        NSRange nameRange=[title rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if(nameRange.location!=NSNotFound){
            
            [filteredResults addObject:title];
        }
    }
    
}

#pragma mark- Search Bar delegates

-(void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller{
    
    isSearching=YES;
}

-(void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller{
    
    isSearching=NO;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    
    [self filterListForSearchText:searchString];
   
    return YES;

}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
    
    [self filterListForSearchText:[getview.searchDisplayController.searchBar text]];
    
    return YES;
}


#pragma mark --TableView Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(isSearching){
        
        return [filteredResults count];
    }
    else{
        
        return [getDataCopy count];
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellIdentifier=@"cellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==Nil){
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if(isSearching){
        
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[filteredResults objectAtIndex:indexPath.row]];

    }
    else{
        
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[getDataCopy objectAtIndex:indexPath.row]];
    }

    return cell;
}


@end
