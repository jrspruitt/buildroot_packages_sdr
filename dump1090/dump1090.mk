#########################################################################
#
# dump1090
#
#########################################################################

DUMP1090_VERSION = master
DUMP1090_SITE = http://github.com/antirez/dump1090.git
DUMP1090_SITE_METHOD = git
DUMP1090_LICENSE = BSD-3c 
DUMP1090_LICENSE_FILES = COPYING
DUMP1090_INSTALL_STAGING = NO
DUMP1090_DEPENDENCIES = librtlsdr

define DUMP1090_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define DUMP1090_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/dump1090 $(TARGET_DIR)/usr/bin
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/dump1090
    $(INSTALL) -D -m 0755 $(@D)/gmap.html $(TARGET_DIR)/usr/share/dump1090
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/dump1090/tools
    $(INSTALL) -D -m 0755 $(@D)/tools/debug.html $(TARGET_DIR)/usr/share/dump1090/tools
endef

$(eval $(generic-package))
