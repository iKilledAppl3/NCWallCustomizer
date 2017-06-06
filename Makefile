ARCHS = armv7 arm64
TARGET = iphone:clang:latest
SDK = iPhoneOS8.1
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

TWEAK_NAME = NCWallCustomizer
NCWallCustomizer_FILES = Tweak.xm
NCWallCustomizer_FRAMEWORKS = UIKit CoreGraphics QuartzCore
NCWallCustomizer_LIBRARIES += cephei
NCWallCustomizer_CFLAGS = -Wno-error
NCWallCustomizer += -Wl,-segalign,4000
CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += ncwallcustomizer
include $(THEOS_MAKE_PATH)/aggregate.mk
