# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/sokp/tools/getdate)
sokp_BRANCH=SOKP-443

# SOKP RELEASE VERSION
SOKP_VERSION_MAJOR = RC
SOKP_VERSION_MINOR = 04
SOKP_VERSION_MAINTENANCE =

VERSION := $(SOKP_VERSION_MAJOR)-$(SOKP_VERSION_MINOR)$(SOKP_VERSION_MAINTENANCE)

ifndef SOKP_BUILD
    ifdef RELEASE_TYPE
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^SOKP_||g')
        SOKP_BUILD := $(RELEASE_TYPE)
    else
        SOKP_BUILD := UNOFFICIAL
    endif
endif

ifdef SOKP_BUILD
    ifeq ($(SOKP_BUILD), RELEASE)
       SOKP_VERSION := $(TARGET_PRODUCT)-$(SOKP_BRANCH)-$(VERSION)-RELEASE-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(SOKP_BUILD), NIGHTLY)
        SOKP_VERSION := $(TARGET_PRODUCT)-$(SOKP_BRANCH)-$(VERSION)-NIGHTLY-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(SOKP_BUILD), EXPERIMENTAL)
        SOKP_VERSION := $(TARGET_PRODUCT)-$(SOKP_BRANCH)-$(VERSION)-EXPERIMENTAL-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(SOKP_BUILD), UNOFFICIAL)
        SOKP_VERSION := $(TARGET_PRODUCT)-$(SOKP_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
    endif
else
#We reset back to UNOFFICIAL
        SOKP_VERSION := $(TARGET_PRODUCT)-$(SOKP_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
endif



PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(SOKP_VERSION) \
     ro.sokp.version=SOKP-KK443-KTU84M-$(SOKP_BUILD)-$(VERSION)

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sokp.branch=$(SOKP_BRANCH) \
    ro.sokp.device=$(SOKP_PRODUCT)

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1
    
# SOKP ROM Statistics and SOKP ROM Identification
PRODUCT_PROPERTY_OVERRIDES += \
ro.romstats.askfirst=1 \
ro.romstats.ga=UA-48001349-3 \
ro.romstats.name=SOKP \
ro.romstats.url=http://stats.sonic-developers.com/stats \
ro.romstats.version=SOKP-$(SOKP_BRANCH)-$(VERSION)-$(SOKP_BUILD)
