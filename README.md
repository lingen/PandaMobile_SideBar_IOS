# PandaMobile_SideBar_IOS
PandaMobile_Sidebar is a simple project which support IOS Sidebar UI (OC)

It's looks like:

![SideBar Preview](http://media.lingenliu.com/panda_mobile_sidebar_01.png-mobile.png)

## Add dependency

PandaMobile_SideBar_iOS support cocoapods,you can add it to your proejct by cocoapods

~~~
  pod 'PandaMobile_SideBar_IOS', '~> 0.0.1'
~~~

### How to Use It

First, import **OPUSideBarViewController**,Which provider sidebar ui support

~~~
#import <PandaMobile_SideBar_IOS/OPUSideBarViewController.h>
~~~

Second, create a viewcontroller extends **OPUSideBarViewController**

~~~
@interface OPEMailSessionViewController : OPUSideBarViewController

@end
~~~

Third, implement the **OPUSideBarViewControllerDelegate** in **ViewDidLoad** method

~~~
- (void)viewDidLoad {
    [super viewDidLoad];
    // set OPUSideBarViewControllerDelegate to self
    self.delegate = self;
    
    //this code is very import,call this method to layout your viewcontroller to a sidebar view
    [super OPU_layoutSideBar];
}
~~~



~~~
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

~~~

*  **-(UIView*)OPU_sideBarView ** return the sidebar view
* **-(CGFloat)OPU_sideBarViewWidth** set the width for your sidebar view
* **-(UIView*)OPU_mainView** set the main view which size equals your device's width and height



### The Sample Code

you can get a sample code in source,which name is ***PandaMobile_SideBar_IOS.sample***



That' all, please enjoy it;