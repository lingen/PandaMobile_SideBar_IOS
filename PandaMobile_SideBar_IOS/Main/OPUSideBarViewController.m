//
//  OPUSideBarViewController.m
//  PandaEmail_IOS
//
//  Created by lingen on 2017/4/26.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import "OPUSideBarViewController.h"

@interface OPUSideBarViewController ()

@property (nonatomic,assign) CGFloat beginX;

@property (nonatomic,strong) UIView* blankView;

@property (nonatomic,assign) CGFloat leftViewWidth;

@property (nonatomic,strong) UIView* leftView;

@property (nonatomic,strong) UIView* mainView;

@property (nonatomic,assign) BOOL leftBarShowed;

@end

@implementation OPUSideBarViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)OPU_layoutSideBar{
    [self P_OPU_initData];
    [self P_OPU_initBlankView];
    [self P_OPU_initView];
    [self P_OPU_initNavigation];
    [self P_OPU_initGestureRecognizer];
}

-(void)P_OPU_initData{
    _leftViewWidth = [_delegate OPU_sideBarViewWidth];
    _leftView = [_delegate OPU_sideBarView];
    _mainView = [_delegate OPU_mainView];
}


-(void)P_OPU_initBlankView{
    _blankView = [[UIView alloc] init];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat width = screenBounds.size.width + _leftViewWidth;
    
    _blankView.frame = CGRectMake(0 - _leftViewWidth, 0, width, screenBounds.size.height);
    _blankView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_blankView];
}

-(void)P_OPU_initView{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    //add left view
    _leftView.frame = CGRectMake(0 , 0, _leftViewWidth, screenBounds.size.height);
    [_blankView addSubview:_leftView];

    //add right view
    _mainView.layer.shadowOpacity = 0.8;
    _mainView.clipsToBounds = NO;
    _mainView.frame = CGRectMake(_leftViewWidth, 64, screenBounds.size.width, screenBounds.size.height - 64);
    [_blankView addSubview:_mainView];
}

-(void)P_OPU_initNavigation{
    UIBarButtonItem* mailButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"邮" style:UIBarButtonItemStylePlain target:self action:@selector(P_OPU_actionForSideBar)];
    self.navigationItem.leftBarButtonItem = mailButtonItem;
}

-(void)P_OPU_actionForSideBar{
    if (!_leftBarShowed) {
        [self OPU_showSideBarView];
    }else{
        [self OPU_hiddenSideBarView];
    }
}

-(void)P_OPU_initGestureRecognizer{
    UIPanGestureRecognizer* tableViewSwipeGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(P_OPU_tableViewSwipe:)];
    [self.blankView addGestureRecognizer:tableViewSwipeGestureRecognizer];
}


-(void)P_OPU_tableViewSwipe:(UIPanGestureRecognizer*)recognizer{

    if (recognizer.state == UIGestureRecognizerStateBegan) {
        _beginX = self.blankView.frame.origin.x;
    }
    else if(recognizer.state == UIGestureRecognizerStateChanged){
        
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGPoint point = [recognizer translationInView:_mainView];
        CGFloat moveX = point.x;

        CGFloat targetX = _beginX + moveX;

        if (targetX >= 0 - _leftViewWidth  && targetX <= 0){
            self.blankView.frame = CGRectMake(targetX, 0, screenBounds.size.width + _leftViewWidth, screenBounds.size.height);
        }
        
    }else if(recognizer.state == UIGestureRecognizerStateEnded){
        CGFloat finalX = self.blankView.frame.origin.x;

        if (finalX > 0 - (_leftViewWidth / 2)){
            [self OPU_showSideBarView];
        }else{
            [self OPU_hiddenSideBarView];
        }
    }
    
}


-(void)OPU_showSideBarView{
    __weak typeof(self) weakSelf = self;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.blankView.frame = CGRectMake(0, 0, screenBounds.size.width + _leftViewWidth, screenBounds.size.height);
    }];
    _leftBarShowed = YES;
}

-(void)OPU_hiddenSideBarView{
    __weak typeof(self) weakSelf = self;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.blankView.frame = CGRectMake(0-_leftViewWidth, 0, screenBounds.size.width + _leftViewWidth, screenBounds.size.height);
    }];
    _leftBarShowed = NO;
}
@end
