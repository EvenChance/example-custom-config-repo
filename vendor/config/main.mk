# do not rename this or change path
DEVICE_PACKAGE_OVERLAYS += vendor/custom/vendor/overlay/common

# Seedvault
PRODUCT_PACKAGES += \
    Seedvault

# Fix for Google Camera
PRODUCT_COPY_FILES += \
	vendor/custom/prebuilt/google_experience.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google_experience.xml
