KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

KBUILD_OPTIONS += CONFIG_POWER_RESET_EXYNOS=m

EXTRA_SYMBOLS += $(OUT_DIR)/../gs/google-modules/bms/Module.symvers

include $(KERNEL_SRC)/../gs/kernel/device-modules/Makefile.include

modules modules_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) \
	$(KBUILD_OPTIONS) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" KBUILD_EXTRA_SYMBOLS="$(EXTRA_SYMBOLS)" $(@)
