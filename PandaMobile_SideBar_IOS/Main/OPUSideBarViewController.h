//
//  OPUSideBarViewController.h
//  PandaEmail_IOS
//
//  Created by lingen on 2017/4/26.
//  Copyright © 2017年 lingen.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OPUSideBarViewControllerDelegate <NSObject>

@required

-(UIView*)OPU_sideBarView;

-(CGFloat)OPU_sideBarViewWidth;

-(UIView*)OPU_mainView;

@end

@interface OPUSideBarViewController : UIViewController

@property (nonatomic,weak) id<OPUSideBarViewControllerDelegate> delegate;

-(void)OPU_layoutSideBar;

-(void)OPU_showSideBarView;

-(void)OPU_hiddenSideBarView;

@end
