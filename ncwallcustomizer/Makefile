TARGET = iphone:clang:latest
SDK = iPhoneOS8.1
ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = NCWallCustomizer
NCWallCustomizer_FILES = NCWallCustomizer.mm
NCWallCustomizer_INSTALL_PATH = /Library/PreferenceBundles
NCWallCustomizer_FRAMEWORKS = UIKit MessageUI CoreGraphics
NCWallCustomizer_PRIVATE_FRAMEWORKS = Preferences AppSupport
NCWallCustomizer_LIBRARIES += cepheiprefs MobileGestalt rocketbootstrap 
CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error 

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NCWallCustomizer.plist$(ECHO_END)
