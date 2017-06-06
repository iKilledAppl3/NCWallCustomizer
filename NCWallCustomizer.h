//ncwallcustomizer custom header file 
//this is all the headers we need 
//this makes it easier to read and cleans up our code a bit 
//but not by much xD 

//headers needed
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBTintedTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <CepheiPrefs/HBImageTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>

//prefs stuff
@interface NCWallCustomizerListController : HBListController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@end

UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];

//tweak xm stuff 
@interface SBNotificationCenterViewController : UIViewController {
UIView * _backgroundView;

}
@end