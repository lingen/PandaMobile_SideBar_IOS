//
//  OPEMailSessionViewController.m
//  PandaEmail_IOS
//
//  Created by lingen on 2017/4/12.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import "OPEMailSessionViewController.h"
#import "OPEMailSessionViewCell.h"
#import "OPEIconTextTableViewCell.h"

@interface OPEMailSessionViewController () <UITableViewDataSource,UITableViewDelegate,OPUSideBarViewControllerDelegate>


@property (strong, nonatomic)  UITableView *sessionTableView;

@property (nonatomic,strong) UITableView *mailFolderTableView;

@end

static NSString* MAIL_SESSION_VIEW_CELL = @"MAIL_SESSION_VIEW_CELL";

static NSString* MAIL_FOLDER_VIEW_CELL = @"MAIL_FOLDER_VIEW_CELL";

@implementation OPEMailSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self p_initMailFolderTableView];
    [self p_initTableView];
    [super OPU_layoutSideBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Init

-(void)p_initTableView{
    _sessionTableView = [[UITableView alloc] init];
    [_sessionTableView registerNib:[UINib nibWithNibName:@"OPEMailSessionViewCell" bundle:nil] forCellReuseIdentifier:MAIL_SESSION_VIEW_CELL];
    _sessionTableView.delegate = self;
    _sessionTableView.dataSource = self;

}

-(void)p_initMailFolderTableView{
    _mailFolderTableView = [[UITableView alloc] init];
    _mailFolderTableView.backgroundColor = [UIColor whiteColor];
    [_mailFolderTableView registerNib:[UINib nibWithNibName:@"OPEIconTextTableViewCell" bundle:nil] forCellReuseIdentifier:MAIL_FOLDER_VIEW_CELL];
    _mailFolderTableView.delegate = self;
    _mailFolderTableView.dataSource = self;
    _mailFolderTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _mailFolderTableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark Session TableView UITableViewDataSource代理

-(NSInteger)session_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)session_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell =  [tableView dequeueReusableCellWithIdentifier:MAIL_SESSION_VIEW_CELL];
    return cell;
}

-(CGFloat)session_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#pragma mark Folder TableView UITableViewDataSource代理

-(NSInteger)folder_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)folder_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell =  [tableView dequeueReusableCellWithIdentifier:MAIL_FOLDER_VIEW_CELL];
    return cell;
}

-(CGFloat)folder_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark UITableViewDelegate代理

#pragma mark UITableViewDataSource 分流
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _sessionTableView) {
        return [self session_tableView:tableView numberOfRowsInSection:section];
    }else if(tableView == _mailFolderTableView){
        return [self folder_tableView:tableView numberOfRowsInSection:section];
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _sessionTableView) {
        return [self session_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else if(tableView == _mailFolderTableView){
        return [self folder_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _sessionTableView) {
        return [self session_tableView:tableView heightForRowAtIndexPath:indexPath];
    }else if(tableView == _mailFolderTableView){
        return [self folder_tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 0;
}

#pragma mark OPESideBarViewControllerDelegate

-(UIView*)OPU_sideBarView{
    return _mailFolderTableView;
}

-(CGFloat)OPU_sideBarViewWidth{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    return screenBounds.size.width - 100;
}

-(UIView*)OPU_mainView{
    return _sessionTableView;
}

@end
