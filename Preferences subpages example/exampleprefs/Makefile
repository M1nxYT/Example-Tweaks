TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ExamplePrefs

ExamplePrefs_FILES = ExamplePageOneListController.m ExamplePageTwoListController.m
ExamplePrefs_FRAMEWORKS = UIKit
ExamplePrefs_PRIVATE_FRAMEWORKS = Preferences
ExamplePrefs_INSTALL_PATH = /Library/PreferenceBundles
ExamplePrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
