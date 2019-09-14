# Debug current init_sony settings
$(info device-sony-common-init: init_sony for "$(TARGET_DEVICE)", platform "$(PRODUCT_PLATFORM)", with '$(BOARD_SONY_INIT_FLAGS)')

ramdisk_init           := $(TARGET_RAMDISK_OUT)/init
ramdisk_init_real      := $(TARGET_RAMDISK_OUT)/init.real
ramdisk_init_sony      := $(TARGET_RAMDISK_OUT)/sbin/init_sony
ramdisk_keycheck       := $(TARGET_RAMDISK_OUT)/sbin/keycheck
ramdisk_toybox_init    := $(TARGET_RAMDISK_OUT)/sbin/toybox_init
recovery_toybox_static := $(TARGET_RECOVERY_ROOT_OUT)/system/bin/toybox_static

# If /init is a file and not a symlink then rename it to /init.real
# and make /init be a symlink to /sbin/init_sony (which will execute
# /init.real, if appropriate.
$(ramdisk_init_real): \
	$(ramdisk_init) \
	$(ramdisk_init_sony) \
	$(ramdisk_keycheck) \
	$(recovery_toybox_static)
	cp $(recovery_toybox_static) $(ramdisk_toybox_init)
	if [ ! -L $(ramdisk_init) ]; then \
	  mv $(ramdisk_init) $(ramdisk_init_real); \
	  ln -s /sbin/init_sony $(ramdisk_init); \
	else \
	  echo "init.real: $(ramdisk_init) is already a symlink"; \
	fi

ALL_DEFAULT_INSTALLED_MODULES += $(ramdisk_init_real)
