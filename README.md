searchTable
===========

About:-

I build a control to search your table view.

	1. No more big bundles of code.
	2. Just import two classes.
	3. A handful of code and your search works perfectly.
	4. Works perfectly for iPhone 5 screens.

Very easy:-

This is easy to use control just a few lines of code which you have to copy and paste, and your works done.

Steps:-

	1. Make a view controller/ if doing on storyboards then also not an issue.
		
		a. I have iViewController.h /.m in this project.  
	
	2. Add iGetData.h/ .m to your project.

	3. Add iTableView.h/ .m in your project.

	4.  In .h file Make three properties:
		
		@property(nonatomic,retain)UITableView *showTableView;
		@property(nonatomic,retain)UISearchBar *searchBar;
		@property(nonatomic,retain)UISearchDisplayController *searchBarController;

		Check this out on iViewController.h file in the project.

	5. Make a iTableView class object which you have imported and allocate it.

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

		Reference:- iViewController.m

	6. Add the below given methods in your ViewController.m file:

	
		#pragma mark --Create Search Bar

		-(void)createSearch{
    
   			 // alloc search bar
    		self.searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 320, 60)];
    		self.searchBarController=[[UISearchDisplayController alloc] 				initWithSearchBar:self.searchBar contentsController:self];
    		[self.searchBar setDelegate:tabDelegate];
   		 [self.searchBarController setDelegate:tabDelegate];
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


		Reference:- iViewController.m

——————————And you are done your work is finished just start searching——————————————

Explanation:- 

	1. iTableView Class:- This class has all the delegates and methods to search the 				table. 

	2. iGetData Class:- This class has an array which contains the data to be shown in 				the tableView. Change it accordingly.
